<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="PaidReportPage.aspx.cs" Inherits="Admin_PaidReportPage" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .divuc
        {
            display: inline-block;
            margin-right: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <h1 align="center">
        Paid Report</h1>
    <br />
    <table width="100%" align="left">
        <tr>
            <td align="left" style="width: 20%;">
                <strong>Sort By :-</strong>
            </td>
            <td>
                <asp:DropDownList ID="DDl_SortBy" runat="server" AutoPostBack="true" Style="border: 1px solid #ccc;
                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                    padding: 8px; margin: 0; width: 186px;" OnSelectedIndexChanged="DDl_SortBy_SelectedIndexChanged">
                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Utility Company" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Date To Date" Value="2"></asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Search By Check No. :-</strong>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txt_SearchChk" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 186px;"></asp:TextBox>
            </td>
        </tr>
        <tr id="TrDatePart" runat="server" visible="false">
            <td align="left">
                <strong>Date :-</strong>
            </td>
            <td>
                <asp:TextBox ID="txtFromDate" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 168px;"
                    Placeholder="From"></asp:TextBox>
                <%-- <asp:RequiredFieldValidator ID="rfv_txtFromDate" runat="server" ValidationGroup="Date"
                    ControlToValidate="txtFromDate" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFromDate">
                </ajaxToolkit:CalendarExtender>
                &nbsp;
                <asp:TextBox ID="txtToDate" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 168px;"
                    Placeholder="To"></asp:TextBox>
                <%--    <asp:RequiredFieldValidator ID="rfv_txtToDate" runat="server" ValidationGroup="Date"
                    ControlToValidate="txtToDate" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtToDate">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr id="trUtility" runat="server" visible="false">
            <td id="tdtrUtility" runat="server" visible="false">
                <strong>Utility Company :-</strong>
            </td>
            <td>
                <div id="DivUtility" runat="server" class="divuc">
                    <asp:DropDownList ID="DDL_Utility" runat="server" AutoPostBack="true" Style="border: 1px solid #ccc;
                        font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                        padding: 8px; margin: 0; width: 186px;" OnSelectedIndexChanged="DDL_Utility_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div id="PPLZones" runat="server" class="divuc" visible="false">
                    <strong>Zone:</strong>&nbsp;
                    <asp:DropDownList ID="DDL_Zone" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                        font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 146px;">
                        <asp:ListItem Text="All Zone" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Zone 1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Zone 2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Zone CACLV" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div id="MetedJobType" runat="server" class="divuc" visible="false">
                    <strong>Type:</strong>&nbsp;
                    <asp:DropDownList ID="DDL_MetedType" runat="server" Style="border: 1px solid #ccc;
                        font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                        padding: 8px; margin: 0; width: 146px;">
                        <asp:ListItem Text="All" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Warm" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Warm Plus" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </td>
        </tr>
        <tr id="AllJobType" runat="server" visible="false">
            <td>
                <strong>Job Type :-</strong>
            </td>
            <td>
                <asp:CheckBox ID="chkAct129" runat="server" onclick="ChkAct129(this.id);" />
                Act 129
                <asp:CheckBox ID="chkBaseLoad" runat="server" onclick="ChkOtherJobType(this.id);" />
                BaseLoad Only
                <asp:CheckBox ID="chkHighPriority" runat="server" />
                High Priority
                <asp:CheckBox ID="chkLowCost" runat="server" />
                Low Cost
                <asp:CheckBox ID="chkFullCost" runat="server" Text="Full Cost" onclick="ChkOtherJobType(this.id);" />
                <br />
                <asp:CheckBox ID="chkAct129II" runat="server" onclick="ChkAct129II(this.id);" />
                Act 129 II
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button ID="btn_Search" runat="server" class="btn_all" Text="Run Report" OnClick="btn_Search_Click" />
            </td>
        </tr>
    </table>
    <br />
    <br />
        <div style="width: 100%; overflow: auto; max-height: 550px;" >
    <div class="grid">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th>
                    Customer Name
                </th>
                <th>
                    Job Number
                </th>
                <th>
                    Job Type
                </th>
                <th>
                    Total Amount
                </th>
                <th>
                    Paid Amount
                </th>
                <th>
                    Paid Date
                </th>
                <th>
                    Payment Type
                </th>
                <th>
                    Payment No
                </th>
            </tr>
            <% if (dtMergeAllPaidJob != null)
               {
                   if (dtMergeAllPaidJob.Rows.Count > 0)
                   {
                       for (int i = 0; i < dtMergeAllPaidJob.Rows.Count; i++)
                       {
                           decimal str_total;
                           string strTotal = dtMergeAllPaidJob.Rows[i]["PaidAmount"].ToString();
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
            <tr class="red">
                <td class="bold">
                    <%=dtMergeAllPaidJob.Rows[i]["FirstName"].ToString()%>
                    <%=dtMergeAllPaidJob.Rows[i]["Lastname"].ToString()%>
                </td>
                <td>
                    <%=dtMergeAllPaidJob.Rows[i]["JobNumber"].ToString()%>
                </td>
                <td>
                    <%if (Convert.ToString(dtMergeAllPaidJob.Rows[i]["UtilityCompany1"]) == "Warm" || Convert.ToString(dtMergeAllPaidJob.Rows[i]["UtilityCompany1"]) == "Warm Plus")
                      {
                          JobType = "";
                          JobType = Convert.ToString(dtMergeAllPaidJob.Rows[i]["UtilityCompany1"]);%>
                    <%=JobType%>
                    <% }
                      else
                      {
                          JobType = "";
                          if (Convert.ToBoolean(dtMergeAllPaidJob.Rows[i]["Act129"]) == true)
                          {
                              JobType = "Act 129";
                          }
                          if (Convert.ToBoolean(dtMergeAllPaidJob.Rows[i]["BaseLoadOnly"]) == true)
                          {
                              JobType += ",BaseLoad Only";
                          }
                          if (Convert.ToBoolean(dtMergeAllPaidJob.Rows[i]["HighPriority"]) == true)
                          {
                              JobType += ",High Priority";
                          }
                          if (Convert.ToBoolean(dtMergeAllPaidJob.Rows[i]["FullCost"]) == true)
                          {
                              JobType += ",Full Cost";
                          }
                          if (Convert.ToBoolean(dtMergeAllPaidJob.Rows[i]["Act129II"]) == true)
                          {
                              JobType += ",Act 129 II";
                          }
                          if (Convert.ToBoolean(dtMergeAllPaidJob.Rows[i]["LowCost"]) == true)
                          {
                              JobType += ",Low Cost";
                          }
                          JobType = JobType.TrimStart(',');%>
                    <%=JobType%>
                    <%}%>
                </td>
                <td>
                    <%=dtMergeAllPaidJob.Rows[i]["PaidTotalAmount"].ToString()%>
                </td>
                <td>
                    <%=dtMergeAllPaidJob.Rows[i]["PaidAmount"].ToString()%>
                </td>
                <td>
                    <%=Convert.ToDateTime(dtMergeAllPaidJob.Rows[i]["UpdatedDate"]).ToString("MM-dd-yyy")%>
                </td>
                <td>
                    <%=dtMergeAllPaidJob.Rows[i]["Payment_Type"].ToString()%>
                </td>
                <td>
                  <%=dtMergeAllPaidJob.Rows[i]["PaymentType_No"].ToString()%>
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
    <script type="text/javascript">
        function ChkAct129(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkAct129.ClientID %>').checked = false;
                document.getElementById('<%= chkAct129II.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ChkAct129II(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkAct129.ClientID %>').checked = false;
                        if (document.getElementById('<%= chkBaseLoad.ClientID %>').checked == true && document.getElementById('<%= chkFullCost.ClientID %>').checked == true) {
                            document.getElementById('<%= chkBaseLoad.ClientID %>').checked = false;
                            document.getElementById('<%= chkFullCost.ClientID %>').checked = false;
                        }

                        <%--document.getElementById('<%= chkLowCost.ClientID %>').checked = false;
                        document.getElementById('<%= chkAct129II.ClientID %>').checked = false;--%>
                        CheckBox.checked = true;
                    }
                }
                function ChkOtherJobType(ID) {
                    var CheckBox = document.getElementById(ID);
                    if (!CheckBox.checked) {
                        CheckBox.checked = false;
                    }
                    else {
                        if (document.getElementById('<%= chkAct129II.ClientID %>').checked == true) {
                            document.getElementById('<%= chkBaseLoad.ClientID %>').checked = false;
                            document.getElementById('<%= chkFullCost.ClientID %>').checked = false;
                        }
                        CheckBox.checked = true;
                    }
                }
    </script>

</asp:Content>
