<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="TimeClockReport.aspx.cs" Inherits="Admin_TimeClockReport" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:GridView ID="grdEmployeTimeTracking" runat="server">
    </asp:GridView>--%>
    <br />
    <br />
    <asp:UpdatePanel ID="UpPnlEmployee" runat="server">
        <ContentTemplate>
            <table align="center">
                <tr>
                    <td>
                        <strong>Employee:-</strong>&nbsp;<asp:DropDownList ID="DDL_Employee" runat="server"
                            Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                            color: black; border-radius: 5px; padding: 8px; margin: 0; width: 200px;" MaxLength="40"
                            AutoPostBack="true" OnSelectedIndexChanged="DDL_Employee_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <div id="DivGrd" runat="server">
        <h1 align="center">
            Date -
            <% str = DateTime.Now.ToString("MM/dd/yyyy");%>
            <%= str %>
        </h1>
        <br />
        <div class="rounded_corners" style="width: 100%;">
            <asp:GridView ID="grdEmployeTimeTracking" runat="server" Width="100%" DataKeyNames="Emp_Id"
                AutoGenerateColumns="false" OnRowUpdating="grdEmployeTimeTracking_RowUpdating"
                OnRowDeleting="grdEmployeTimeTracking_RowDeleting" PageSize="10" AllowPaging="true"
                OnPageIndexChanging="grdEmployeTimeTracking_PageIndexChanging" HeaderStyle-BackColor="#3AC0F2"
                HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                RowStyle-ForeColor="#3A3A3A">
                <Columns>
                    <asp:TemplateField HeaderText="Employee Name">
                        <ItemTemplate>
                            <%#Eval("FullName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Working Duration">
                        <ItemTemplate>
                            <%--<asp:Label ID="lnlBlank" runat="server" Text="-" Visible="false"></asp:Label>  OnRowDataBound="grdEmployeTimeTracking_RowDataBound"--%>
                            <asp:Label ID="lnlTm" runat="server" Text='<%# getdate(Eval("TotalWorkingDuration"))%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_Edit" runat="server" Text="View Report" Visible="false" CommandName="Update"></asp:LinkButton>
                            <a href="TimeClockReport.aspx?Emp_Id=<%#Eval("Emp_Id") %>">View Report</a>
                            <%--<asp:LinkButton ID="lnk_Delete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this Category?');"></asp:LinkButton>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div id="DivViewReport" runat="server" visible="false">
        <h1 align="center">
            Report of
            <%=EmpName %>
        </h1>
        <br />
        <table align="center">
            <tr>
                <td>
                    Report:-
                </td>
                <td>
                    <asp:DropDownList ID="DDL_Report" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Report_SelectedIndexChanged">
                        <asp:ListItem Text="Select Report" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Weekly" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Bi-Weekly" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Date To Date" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Monthly" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Yearly" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table align="center" id="TblMonthly" runat="server" visible="false">
            <tr>
                <td>
                </td>
                <td>
                    <span id="spnMonth" runat="server">Month:-</span>
                    <asp:DropDownList ID="DDL_Month" runat="server">
                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Jan." Value="1"></asp:ListItem>
                        <asp:ListItem Text="Feb." Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mar." Value="3"></asp:ListItem>
                        <asp:ListItem Text="Apr." Value="4"></asp:ListItem>
                        <asp:ListItem Text="May" Value="5"></asp:ListItem>
                        <asp:ListItem Text="June" Value="6"></asp:ListItem>
                        <asp:ListItem Text="July" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Aug." Value="8"></asp:ListItem>
                        <asp:ListItem Text="Sept." Value="9"></asp:ListItem>
                        <asp:ListItem Text="Oct." Value="10"></asp:ListItem>
                        <asp:ListItem Text="Nov." Value="11"></asp:ListItem>
                        <asp:ListItem Text="Dec." Value="12"></asp:ListItem>
                    </asp:DropDownList>
                    Year:-<asp:DropDownList ID="DDL_Year" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table align="center" id="TblBetvnDate" runat="server" visible="false">
            <tr>
                <td>
                </td>
                <td>
                    From Date:-
                    <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="AjxCal" runat="server" TargetControlID="txtFromDate">
                    </ajaxToolkit:CalendarExtender>
                    &nbsp;&nbsp;&nbsp;To Date:-<asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="AjxCal2" runat="server" TargetControlID="txtToDate">
                    </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
        </table>
        <table align="center">
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="BtnGo" runat="server" Text="Go" OnClick="BtnGo_Click" />&nbsp;&nbsp;&nbsp;<asp:Button
                        ID="BtnShowSwipe" runat="server" Text="Total Swipes" OnClick="BtnShowSwipe_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div class="rounded_corners" style="width: 100%;">
            <asp:GridView ID="GrdEmployeeTracReport" runat="server" Width="100%" DataKeyNames="Emp_Id"
                AutoGenerateColumns="false" OnRowUpdating="GrdEmployeeTracReport_RowUpdating"
                OnRowDeleting="GrdEmployeeTracReport_RowDeleting" PageSize="10" AllowPaging="true"
                OnPageIndexChanging="GrdEmployeeTracReport_PageIndexChanging" HeaderStyle-BackColor="#3AC0F2"
                HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                RowStyle-ForeColor="#3A3A3A">
                <Columns>
                    <asp:BoundField HeaderText="Date" DataField="ADate" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:TemplateField HeaderText="Working Duration">
                        <ItemTemplate>
                            <%--<asp:Label ID="lnlBlank" runat="server" Text="-" Visible="false"></asp:Label>  OnRowDataBound="grdEmployeTimeTracking_RowDataBound"--%>
                            <asp:Label ID="lnlTm" runat="server" Text='<%# getdate(Eval("TotalWorkingDuration"))%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="ShowSwipes.aspx?EId=<%#Eval("Emp_Id")%>&Adate=<%#Eval("Adate")%>" target="_blank">
                                View Swipes</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GrdAllSwipe" runat="server" Width="100%" DataKeyNames="Emp_Id"
                Visible="false" AutoGenerateColumns="false" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A">
                <Columns>
                    <asp:BoundField HeaderText="Date" DataField="ADate" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField HeaderText="Swipe-In" DataField="SwipeIn" DataFormatString="{0:hh:mm:ss tt}" />
                    <asp:BoundField HeaderText="Swipe-Out" DataField="SwipeOut" DataFormatString="{0:hh:mm:ss tt}" />
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <div style="float: right; margin-right: 115px;" id="DivTotal" runat="server" visible="false">
            <strong>Total Working:-<%=TotalWorkingDuration%></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Over
                Time:-<%=OverTime%></strong>
        </div>
    </div>
</asp:Content>
