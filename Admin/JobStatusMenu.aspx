<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="JobStatusMenu.aspx.cs" Inherits="Admin_JobStatusMenu" Title="Custom Weatherization/ Job Account Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jobstatus">
        <h1>
            <%--Jobs Status And Count--%>Accounts Receivables by Utility Company</h1>
        <%if (dt_jobMenu.Rows.Count > 0)
          {
              for (int i = 0; i < dt_jobMenu.Rows.Count; i++)
              {
        %>
        <div class="circle_btn">
            <a href="JobsReportStatus.aspx?UC=<%=dt_jobMenu.Rows[i]["UtilityCompany"].ToString()%>">
                <%=dt_jobMenu.Rows[i]["UtilityCompany"].ToString()%></a> <span class="count">
                    <%=dt_jobMenu.Rows[i]["NumberofJobs"].ToString()%></span>
        </div>
        <%}
          } %>
        <%if (dt_jobPPLZ1.Rows.Count > 0)
          {
              for (int i = 0; i < dt_jobPPLZ1.Rows.Count; i++)
              {
        %>
        <div class="circle_btn">
            <a href="JobsReportStatus.aspx?UC=<%=dt_jobPPLZ1.Rows[i]["UtilityCompany"].ToString()%>">
                <%=dt_jobPPLZ1.Rows[i]["UtilityCompany"].ToString()%></a> <span class="count">
                    <%=dt_jobPPLZ1.Rows[i]["NumberofJobs"].ToString()%></span>
        </div>
        <%}
          } %>
        <%if (dt_jobPPLZ2.Rows.Count > 0)
          {
              for (int i = 0; i < dt_jobPPLZ2.Rows.Count; i++)
              {
        %>
        <div class="circle_btn">
            <a href="JobsReportStatus.aspx?UC=<%=dt_jobPPLZ2.Rows[i]["UtilityCompany"].ToString()%>">
                <%=dt_jobPPLZ2.Rows[i]["UtilityCompany"].ToString()%></a> <span class="count">
                    <%=dt_jobPPLZ2.Rows[i]["NumberofJobs"].ToString()%></span>
        </div>
        <%}
          } %>
        <%if (dt_AllJob.Rows.Count > 0)
          {  
        %>
        <div class="circle_btn">
            <a href="JobsReportStatus.aspx?UC=All">All Job</a> <span class="count">
                <%=AllJob%></span>
        </div>
        <%} %>
        <div style="margin-top: 19%; margin-left: 35%;">
            <asp:Button ID="btn_ReceivePayment" runat="server" Text="Receive Payment" class="btn_all"
                OnClick="btn_ReceivePayment_Click" />
        </div>
    </div>
    <div class="btmsubmit" style="margin-top: 25%;">
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
            class="btn_all" />
        <%--<input name="" type="submit" value="Cancel" />--%>
    </div>
    <%-- <div class="circle_btn">
            <a href="JobsReportStatus.aspx?UC=<%=dt_jobMenu.Rows[i]["UtilityCompany"].ToString()%>">
                <%=dt_jobMenu.Rows[i]["UtilityCompany"].ToString()%></a> <span class="count">
                    <%=dt_jobMenu.Rows[i]["NumberofJobs"].ToString()%></span>
        </div>--%>
</asp:Content>
