<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    CodeFile="JobsStatus.aspx.cs" Inherits="JobsStatus" Title="Job Status" %>

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
        <div style="width: 548px; margin: 0 auto;">
            <div class="alljobs_btn" style="margin: 0px 14px 20px 0px;">
                <asp:LinkButton ID="BtnAll" runat="server" Text="All jobs" OnClick="BtnAll_Click"></asp:LinkButton>
            </div>
            <div class="red_btn" style="margin: 0 14px 20px 15px;">
                <%--<a href="#">30+ Days</a>--%>
                <asp:LinkButton ID="lnkRed" runat="server" Text="30+ Days" OnClick="lnkRed_Click"></asp:LinkButton>
            </div>
            <div class="blue_btn">
                <%--<a href="#">15-30 Days</a>--%>
                <asp:LinkButton ID="lnkBlue" runat="server" Text="15-30 Days" OnClick="lnkBlue_Click"></asp:LinkButton>
            </div>
            <div class="green_btn">
                <%--<a href="#">1-14 Days</a>--%>
                <asp:LinkButton ID="lnkGreen" runat="server" Text="1-14 Days" OnClick="lnkGreen_Click"></asp:LinkButton>
            </div>
        </div>
    </div>
    <div class="grid">
        <%--<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
            <tr>
                <td>--%>
        <asp:GridView runat="server" ID="gvrecords" AllowSorting="true" OnSorting="gvrecords_Sorting"
            Width="100%" DataKeyNames="" CellPadding="5" GridLines="None" showheaderwhenempty="true"
            EmptyDataText="No Records Found !" AutoGenerateColumns="false" OnRowDataBound="gvrecords_RowDataBound">
            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="Black" />
            <Columns>
                <asp:TemplateField HeaderText="Customer Name" SortExpression="FullName">
                    <ItemTemplate>
                        <b>
                            <%#Eval("FirstName") %>
                            <%#Eval("Lastname") %></b>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Number" SortExpression="JobNumber">
                    <ItemTemplate>
                        <a style="color: inherit;" href="AddNewJob.aspx?Back=JobsStatus&Jobs=<%#Eval("JobNumber").ToString()%>&UC=<%#Eval("UtilityCompany").ToString()%>">
                            <%#Eval("JobNumber") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service City / ZipCode" SortExpression="Address">
                    <ItemTemplate>
                        <%#Eval("Address") %><%-- <%#Eval("ServiceZipCode") %>--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Type" SortExpression="JobType_">
                    <ItemTemplate>
                        <asp:Label ID="lbl_G_JobType" runat="server" Text='<%# RemoveComma(Eval("JobType_"))%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Assigned" SortExpression="DateAssigned">
                    <ItemTemplate>
                        <%#Eval("DateAssigned", "{0:d}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <ItemTemplate>
                        <asp:Label ID="lbl_G_Status" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="Contact_DateTime">
                    <ItemTemplate>
                        <asp:Label ID="lbl_G_Contact_DateTime" runat="server" Text='<%#Eval("Contact_DateTime", "{0:MM/dd/yyyy}")%>'></asp:Label>
                        <asp:Label ID="lbl_G_Blank" runat="server" Visible="false" Text=""></asp:Label>
                        <%--<%#Eval("Contact_DateTime", "{0:MM/dd/yyyy}")%>--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%--</td>
            </tr>
        </table>--%>
    </div>
</asp:Content>
