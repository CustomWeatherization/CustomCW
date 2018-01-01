<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="JobsReportStatus.aspx.cs" Inherits="Admin_JobsReportStatus" Title="Custom Weatherization/ Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style5
        {
            width: 80px;
        }
        .style7
        {
            width: 27px;
        }
        .style8
        {
            width: 90px;
        }
        .style9
        {
            width: 44px;
        }
        .style11
        {
            width: 87px;
        }
        .style12
        {
            width: 46px;
        }
        .style13
        {
            width: 72px;
        }
        .style14
        {
            width: 113px;
        }
        .style15
        {
            width: 34px;
        }
        .style18
        {
            width: 1px;
        }
        .style19
        {
            width: 75px;
        }
        .style21
        {
            width: 18px;
        }
        .style22
        {
            width: 101px;
        }
        .style23
        {
            width: 62px;
        }
    </style>
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
        <table width="99%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th style="width: 101px">
                    Customer Name
                </th>
                <th class="style15">
                    Job Number
                </th>
                <th class="style12">
                    Job Type
                </th>
                <th width="80px">
                    Total Amount
                </th>
                <th class="style13">
                   <%-- Paid Amount--%>
                   Date Completed
                </th>
                <th class="style13">
                   <%-- Remaining Amount--%>
                   Return Date
                </th>
                <th class="style14">
                   <%-- Payment Type--%>
                   Due Date
                </th>
                <th class="style5">
                   <%-- Payment No--%>
                   Days Until Due
                </th>
                <%--<th>
                    Status
                </th>--%>
                <th width="7">
                    Manage
                </th>
            </tr>
            </table>
            <div style=" overflow: auto; max-height: 370px;" >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <% if (dtRed != null)
               {
                   if (dtRed.Rows.Count > 0)
                   {
                       for (int i = 0; i < dtRed.Rows.Count; i++)
                       { %>
            <tr class="red">
                <td class="bold" style="width: 101px">
                    <%=dtRed.Rows[i]["FirstName"].ToString()%>
                    <%=dtRed.Rows[i]["Lastname"].ToString()%>
                </td>
                <td class="style15">
                    <%=dtRed.Rows[i]["JobNumber"].ToString()%>
                </td>
                <%--<td><a href="AddNewJob.aspx?Jobs=<%=dtRed.Rows[i]["JobNumber"].ToString()%>&UC=<%=Request.QueryString["UC"].ToString()%>"><%=dtRed.Rows[i]["JobNumber"].ToString()%></a></td>--%>
                <td class="style12">
                    <%if (Convert.ToBoolean(dtRed.Rows[i]["LowCost"]) == true)
                      { %>
                    Low Cost
                    <%}
                      else if (Convert.ToBoolean(dtRed.Rows[i]["FullCost"]) == true)
                      { %>
                    FullCost
                    <%} %>
                </td>
                <td class="style9">
                    $<%=dtRed.Rows[i]["PaidTotalAmount"].ToString()%>
                </td>
                <td class="style13">
                    <%=dtRed.Rows[i]["CWReturnDate"].ToString()%>
                </td>
                <td class="style11">
                    <%=dtRed.Rows[i]["DateCompleted"].ToString()%>
                </td>
                <td class="style14">
                    <%=dtRed.Rows[i]["DueDate"].ToString()%>
                </td>
                <td class="style5">
                -30 
                 <%--   <%=dtRed.Rows[i]["DueDateUntil"].ToString()%>--%>
                </td>
               <%-- <td>
                    <%=dtRed.Rows[i]["PaidStatus"].ToString()%>
                </td>--%>
                <td width="7">
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
                <td class="bold" style="width: 101px">
                    <%=dtBlue.Rows[i]["FirstName"].ToString()%>
                    <%=dtBlue.Rows[i]["Lastname"].ToString()%>
                </td>
                <td class="style15">
                    <%=dtBlue.Rows[i]["JobNumber"].ToString()%>
                    <%--<a href="AddNewJob.aspx?Jobs=<%=dtBlue.Rows[i]["JobNumber"].ToString()%>&UC=<%=Request.QueryString["UC"].ToString()%>">
                        <%=dtBlue.Rows[i]["JobNumber"].ToString()%></a>--%>
                </td>
                <td class="style12">
                    <%if (Convert.ToBoolean(dtBlue.Rows[i]["LowCost"]) == true)
                      { %>
                    Low Cost
                    <%}
                      else if (Convert.ToBoolean(dtBlue.Rows[i]["FullCost"]) == true)
                      { %>
                    FullCost
                    <%} %>
                </td>
                <td class="style9">
                    <%--<%=dtBlue.Rows[i]["PaidAmount"].ToString()%>--%>
                    <%=dtBlue.Rows[i]["PaidTotalAmount"].ToString()%>
                </td>
                <td class="style13">
                    <%=dtBlue.Rows[i]["CWReturnDate"].ToString()%>
                </td>
                <td class="style11">
                    <%=dtBlue.Rows[i]["DateCompleted"].ToString()%>
                </td>
                <td class="style14">
                    <%= dtBlue.Rows[i]["DueDate"].ToString()%>
                </td>
                <td class="style5">
                -30
                   <%-- <%=dtBlue.Rows[i]["DueDateUntil"].ToString()%>--%>
                </td>
               <%-- <td>
                    <%=dtBlue.Rows[i]["PaidStatus"].ToString()%>
                </td>--%>
                <td width="7">
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
                <td class="bold" style="width: 101px">
                    <%=dtGreen.Rows[i]["FirstName"].ToString()%>
                    <%=dtGreen.Rows[i]["Lastname"].ToString()%>
                </td>
                <td class="style15">
                    <%=dtGreen.Rows[i]["JobNumber"].ToString()%>
                    <%--<a href="AddNewJob.aspx?Jobs=<%=dtGreen.Rows[i]["JobNumber"].ToString()%>&UC=<%=Request.QueryString["UC"].ToString()%>">
                        <%=dtGreen.Rows[i]["JobNumber"].ToString()%></a>--%>
                </td>
                <td class="style12">
                    <%if (Convert.ToBoolean(dtGreen.Rows[i]["LowCost"]) == true)
                      { %>
                    Low Cost
                    <%}
                      else if (Convert.ToBoolean(dtGreen.Rows[i]["FullCost"]) == true)
                      { %>
                    FullCost
                    <%} %>
                </td>
                <td class="style9">
                    <%--<%=Convert.ToString(dtGreen.Rows[i]["PaidAmount"])%>--%>
                    <%=dtGreen.Rows[i]["PaidTotalAmount"].ToString()%>
                </td>
                <td class="style13">
                    <%=dtGreen.Rows[i]["CWReturnDate"].ToString()%>
                </td>
                <td class="style11">
                    <%=dtGreen.Rows[i]["DateCompleted"].ToString()%>
                </td>
                <td class="style14">
                    <%=dtGreen.Rows[i]["DueDate"].ToString()%>
                </td>
                <td class="style5">
                   <%-- <%=dtGreen.Rows[i]["DueDateUntil"].ToString()%>--%>
                   -30
                </td>
               <%-- <td>
                    <%=dtGreen.Rows[i]["PaidStatus"].ToString()%>
                </td>--%>
                <td width="7">
                    <a href="ManagePaidReport.aspx?JobID=<%=dtGreen.Rows[i]["JobId"].ToString()%>&UC=<%= Convert.ToString(Request.QueryString["UC"]) %>">
                        Manage</a>
                </td>
            </tr>
            <%}
                   }
               }%>
            <tr>
                <th class="style22" >
                </th>
                <th class="style15">
                </th>
                <th class="style12">
                </th>
                <th class="style9">
                    $<%= Total %>
                </th>
                <th class="style13"></th>
               <%-- <th>
                    <%= TotalPaid %>
                </th>
                <th>
                    <%= TotalRemain%>
                </th>--%>
                <th class="style11">
                </th>
                <th class="style14">
                </th>
                <th class="style5">
                </th>
                <th>
                </th>
            </tr>
        </table>
           </div>
    </div>
</asp:Content>
