<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    CodeFile="SearchResultLname.aspx.cs" Inherits="SearchResultLname" Title="Search Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <h1 align="center">
        No. of Record found=<asp:Label ID="lblno" runat="server"></asp:Label></h1>
    <br />
    <asp:GridView ID="grdLnameResult" Width="100%" runat="server" AutoGenerateColumns="false"
        EmptyDataText="No Record !!" DataKeyNames="JobNumber,UtilityCompany" OnRowUpdating="grdLnameResult_RowUpdating"
        AllowPaging="true" PageSize="50" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A"
        OnPageIndexChanging="grdLnameResult_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="Utility">
                <ItemTemplate>
                    <%#Eval("UtilityCompany")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Number">
                <ItemTemplate>
                    <%#Eval("JobNumber")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Full Name">
                <ItemTemplate>
                    <%#Eval("fullName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Account Number">
                <ItemTemplate>
                    <%#Eval("AccountNumber")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <%#Eval("MailingAddress1")%><br />
                    <%#Eval("MailingCity")%>,<%#Eval("State")%>.<%#Eval("MailingZipCode")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="View Detail">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkView" runat="server" Text="View" CommandName="Update"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
