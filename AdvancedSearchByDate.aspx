<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    CodeFile="AdvancedSearchByDate.aspx.cs" Inherits="AdvancedSearchByDate" Title="Advance Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .calenderEx
        {
            margin: 0px 0px 0px 0px !important;
            padding: 0px 0px 0px 0px !important;
            border: none !important;
            background-color: White !important;
            width: 180px !important;
            height: 185px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="script" runat="server"></asp:ScriptManager> --%>
   <%-- <ajaxToolkit:ToolkitScriptManager ID="script" runat="server">
    </ajaxToolkit:ToolkitScriptManager>--%>
    <div class="advsearch">
        <h3>
            Advanced Search For Jobs By Date Type and Range</h3>
        <div align="center">
            <table width="50%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <label>
                            Start Date
                        </label>
                        <%--<input name="" type="text" />--%>
                        <asp:TextBox ID="txtStartDate" runat="server" MaxLength="10"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalanderState" runat="server" TargetControlID="txtStartDate"
                            PopupButtonID="imgStartDate" Format="MM/dd/yyyy" CssClass="calenderEx">
                        </ajaxToolkit:CalendarExtender>
                        <asp:ImageButton ID="imgStartDate" runat="server" ImageUrl="~/images/cal.gif" />
                        <%--<img src="images/cal.gif" />--%>
                    </td>
                    <td>
                        <label>
                            End Date</label>
                        <%--<input name="" type="text" />--%>
                        <asp:TextBox ID="txtEndDate" runat="server" MaxLength="10"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEndDate"
                            PopupButtonID="imgEndDate" Format="MM/dd/yyyy" CssClass="calenderEx">
                        </ajaxToolkit:CalendarExtender>
                        <asp:ImageButton ID="imgEndDate" runat="server" ImageUrl="~/images/cal.gif" />
                        <%--<img src="images/cal.gif" />--%>
                    </td>
                </tr>
            </table>
        </div>
        <div class="btmsubmit">
            <asp:Button ID="btnDateScheduled" runat="server" Text="Date Scheduled" class="btn_all"
                OnClick="btnDateScheduled_Click" />
            <asp:Button ID="btnDateCompleted" runat="server" Text="Date Completed" class="btn_all"
                OnClick="btnDateCompleted_Click" />
            <asp:Button ID="btnDateAssigned" runat="server" Text="Date Assigned" class="btn_all"
                OnClick="btnDateAssigned_Click" />
            <asp:Button ID="btnDateReturned" runat="server" Text="Date Returned" class="btn_all"
                OnClick="btnDateReturned_Click" />
            <%--<input name="" type="button" value="Search" />
                <input name="" type="button" value="Cancel" />--%>
        </div>
        <br />
        <br />
        <h3>
            Find A Job By Address, City, or State (Service Location)</h3>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="50%">
                    <h4>
                        Enter Address, City, or Zip Code</h4>
                    <%--<input name="" type="text" class="largeinput" />--%>
                    <asp:TextBox ID="txtAddressCityZIp" runat="server" CssClass="largeinput"></asp:TextBox>
                    <br />
                    Then check a box on the right to choose type of search and click the <strong>Find By
                        Geographic</strong> Button
                </td>
                <td>
                    <asp:RadioButton ID="rdoAddress" runat="server" GroupName="G" />
                    Address
                    <%--<asp:CheckBox ID="chkAddress" runat="server" Text="Address" />--%>
                    <br />
                    <br />
                    <asp:RadioButton ID="rdoCity" runat="server" GroupName="G" />
                    City
                    <%--<asp:CheckBox ID="chkCity" runat="server" Text="City" />--%>
                    <br />
                    <br />
                    <asp:RadioButton ID="rdoZipCode" runat="server" GroupName="G" />
                    Zipcode
                    <%--<asp:CheckBox ID="chkZipCode" runat="server" Text="Zip Code" />--%>
                    <br />
                    <br />
                    <asp:RadioButton ID="rdoLastName" runat="server" GroupName="G" />
                    Last Name
                </td>
            </tr>
        </table>
        <div class="btmsubmit">
            <%--<input name="" type="button" value="Find By Geographic" />--%>
            <asp:Button ID="btnFindByGeoGraphic" runat="server" Text="Find By Geographic" class="btn_all"
                OnClick="btnFindByGeoGraphic_Click" />
        </div>
        <%if (StrSearchname != "")
          { %>
        <br />
        <br />
        <h3>
            <%=StrSearchname%></h3>
        <%} %>
    </div>
    <div class="grid">
        <asp:GridView ID="grdAdvanceSearch" runat="server" AutoGenerateColumns="false" DataKeyNames="JobNumber"
            Width="100%" BorderColor="Transparent" GridLines="None" EmptyDataText="No Record Found">
            <Columns>
                <asp:TemplateField HeaderText="Customer Name">
                    <ItemTemplate>
                        <%# Eval("FullName")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Utility Co. #1">
                    <ItemTemplate>
                        <%#Eval("UtilityCompany1")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Type">
                    <ItemTemplate>
                        <%#Eval("JobTypeALL")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Number">
                    <ItemTemplate>
                        <a href="AddNewJob.aspx?Jobs=<%#Eval("JobNumber")%>&UC=<%#Eval("UtilityCompany1")%>">
                            <%#Eval("JobNumber")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Date">
                    <ItemTemplate>
                        <%# ((DateTime)Eval("Ddate")).ToString("MM/dd/yyyy")%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:GridView ID="grdGeographic" runat="server" AutoGenerateColumns="false" DataKeyNames="JobNumber"
            Width="100%" BorderColor="Transparent" GridLines="None" EmptyDataText="No Record Found">
            <Columns>
                <asp:TemplateField HeaderText="Customer Name">
                    <ItemTemplate>
                        <%# Eval("FullName")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Utility Co. #1">
                    <ItemTemplate>
                        <%#Eval("UtilityCompany1")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Type">
                    <ItemTemplate>
                        <%#Eval("JobTypeALL")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Number">
                    <ItemTemplate>
                        <a href="AddNewJob.aspx?Jobs=<%#Eval("JobNumber")%>&UC=<%#Eval("UtilityCompany1")%>">
                            <%#Eval("JobNumber")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <%#Eval("ServiceAddress1")%>
                        ,
                        <%#Eval("CityStateZipCode")%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
