<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="JobsReportStatus.aspx.cs" Inherits="Admin_JobsReportStatus" Title="Custom Weatherization/ Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jobstatus">
        <%if (Request.QueryString["UC"] != null)
          { %>
        <h1>
            <%= Request.QueryString["UC"].ToString()%>
            Jobs Status
        </h1>
        <%} %>
        <div class="red_btn">
            <asp:LinkButton ID="lnkRed" runat="server" Text="30+ Days" OnClick="lnkRed_Click"></asp:LinkButton>
        </div>
        <div class="blue_btn">
            <asp:LinkButton ID="lnkBlue" runat="server" Text="15-30 Days" OnClick="lnkBlue_Click"></asp:LinkButton>
        </div>
        <div class="green_btn">
            <asp:LinkButton ID="lnkGreen" runat="server" Text="1-14 Days" OnClick="lnkGreen_Click"></asp:LinkButton>
        </div>
    </div>
    <div class="clear">
    </div>
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
                    Remaining Amount
                </th>
                <th>
                    Payment Type
                </th>
                <th>
                    Payment No
                </th>
                <th>
                    Status
                </th>
                <th>
                    Manage
                </th>
            </tr>
            <% if (dtRed != null)
               {
                   if (dtRed.Rows.Count > 0)
                   {
                       for (int i = 0; i < dtRed.Rows.Count; i++)
                       { %>
            <tr class="red">
                <td class="bold">
                    <%=dtRed.Rows[i]["FirstName"].ToString()%>
                    <%=dtRed.Rows[i]["Lastname"].ToString()%>
                </td>
                <td>
                    <%=dtRed.Rows[i]["JobNumber"].ToString()%>
                </td>
                <%--<td><a href="AddNewJob.aspx?Jobs=<%=dtRed.Rows[i]["JobNumber"].ToString()%>&UC=<%=Request.QueryString["UC"].ToString()%>"><%=dtRed.Rows[i]["JobNumber"].ToString()%></a></td>--%>
                <td>
                    <%if (Convert.ToBoolean(dtRed.Rows[i]["LowCost"]) == true)
                      { %>
                    Low Cost
                    <%}
                      else if (Convert.ToBoolean(dtRed.Rows[i]["FullCost"]) == true)
                      { %>
                    FullCost
                    <%} %>
                </td>
                <td>
                    <%=dtRed.Rows[i]["PaidTotalAmount"].ToString()%>
                </td>
                <td>
                    <%=dtRed.Rows[i]["PaidAmount"].ToString()%>
                </td>
                <td>
                    <%=dtRed.Rows[i]["PaidRemainingAmount"].ToString()%>
                </td>
                <td>
                    <%=dtRed.Rows[i]["Payment_Type"].ToString()%>
                </td>
                <td>
                    <%=dtRed.Rows[i]["PaymentType_No"].ToString()%>
                </td>
                <td>
                    <%=dtRed.Rows[i]["PaidStatus"].ToString()%>
                </td>
                <td>
                    <a href="ManagePaidReport.aspx?JobID=<%=dtRed.Rows[i]["JobId"].ToString()%>&UC=<%= Convert.ToString(Request.QueryString["UC"]) %>">
                        Manage</a>
                </td>
            </tr>
            <%}
                   }
               }%>
            <%if (dtBlue != null)
              {
                  if (dtBlue.Rows.Count > 0)
                  {
                      for (int i = 0; i < dtBlue.Rows.Count; i++)
                      { %>
            <tr class="blue">
                <td class="bold">
                    <%=dtBlue.Rows[i]["FirstName"].ToString()%>
                    <%=dtBlue.Rows[i]["Lastname"].ToString()%>
                </td>
                <td>
                    <%=dtBlue.Rows[i]["JobNumber"].ToString()%>
                    <%--<a href="AddNewJob.aspx?Jobs=<%=dtBlue.Rows[i]["JobNumber"].ToString()%>&UC=<%=Request.QueryString["UC"].ToString()%>">
                        <%=dtBlue.Rows[i]["JobNumber"].ToString()%></a>--%>
                </td>
                <td>
                    <%if (Convert.ToBoolean(dtBlue.Rows[i]["LowCost"]) == true)
                      { %>
                    Low Cost
                    <%}
                      else if (Convert.ToBoolean(dtBlue.Rows[i]["FullCost"]) == true)
                      { %>
                    FullCost
                    <%} %>
                </td>
                <td>
                    <%=dtBlue.Rows[i]["PaidAmount"].ToString()%>
                </td>
                <td>
                    <%=dtBlue.Rows[i]["PaidTotalAmount"].ToString()%>
                </td>
                <td>
                    <%=dtBlue.Rows[i]["PaidRemainingAmount"].ToString()%>
                </td>
                <td>
                    <%=dtBlue.Rows[i]["Payment_Type"].ToString()%>
                </td>
                <td>
                    <%=dtBlue.Rows[i]["PaymentType_No"].ToString()%>
                </td>
                <td>
                    <%=dtBlue.Rows[i]["PaidStatus"].ToString()%>
                </td>
                <td>
                    <a href="ManagePaidReport.aspx?JobID=<%=dtBlue.Rows[i]["JobId"].ToString()%>&UC=<%= Convert.ToString(Request.QueryString["UC"]) %>">
                        Manage</a>
                </td>
            </tr>
            <%}
                  }
              }%>
            <% if (dtGreen != null)
               {
                   if (dtGreen.Rows.Count > 0)
                   {
                       for (int i = 0; i < dtGreen.Rows.Count; i++)
                       { %>
            <tr class="green">
                <td class="bold">
                    <%=dtGreen.Rows[i]["FirstName"].ToString()%>
                    <%=dtGreen.Rows[i]["Lastname"].ToString()%>
                </td>
                <td>
                    <%=dtGreen.Rows[i]["JobNumber"].ToString()%>
                    <%--<a href="AddNewJob.aspx?Jobs=<%=dtGreen.Rows[i]["JobNumber"].ToString()%>&UC=<%=Request.QueryString["UC"].ToString()%>">
                        <%=dtGreen.Rows[i]["JobNumber"].ToString()%></a>--%>
                </td>
                <td>
                    <%if (Convert.ToBoolean(dtGreen.Rows[i]["LowCost"]) == true)
                      { %>
                    Low Cost
                    <%}
                      else if (Convert.ToBoolean(dtGreen.Rows[i]["FullCost"]) == true)
                      { %>
                    FullCost
                    <%} %>
                </td>
                <td>
                    <%=Convert.ToString(dtGreen.Rows[i]["PaidAmount"])%>
                </td>
                <td>
                    <%=dtGreen.Rows[i]["PaidTotalAmount"].ToString()%>
                </td>
                <td>
                    <%=dtGreen.Rows[i]["PaidRemainingAmount"].ToString()%>
                </td>
                <td>
                    <%=dtGreen.Rows[i]["Payment_Type"].ToString()%>
                </td>
                <td>
                    <%=dtGreen.Rows[i]["PaymentType_No"].ToString()%>
                </td>
                <td>
                    <%=dtGreen.Rows[i]["PaidStatus"].ToString()%>
                </td>
                <td>
                    <a href="ManagePaidReport.aspx?JobID=<%=dtGreen.Rows[i]["JobId"].ToString()%>&UC=<%= Convert.ToString(Request.QueryString["UC"]) %>">
                        Manage</a>
                </td>
            </tr>
            <%}
                   }
               }%>
            <tr>
                <th>
                </th>
                <th>
                </th>
                <th>
                </th>
                <th>
                    <%= Total %>
                </th>
                <th>
                    <%= TotalPaid %>
                </th>
                <th>
                    <%= TotalRemain%>
                </th>
                <th>
                </th>
                <th>
                </th>
                <th>
                </th>
                <th>
                </th>
            </tr>
        </table>
    </div>
</asp:Content>
