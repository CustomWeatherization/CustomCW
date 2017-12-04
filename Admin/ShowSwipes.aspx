<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="ShowSwipes.aspx.cs" Inherits="Admin_ShowSwipes" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <div class="rounded_corners" style="width: 100%;">
        <asp:GridView ID="GrdEmployeeTracReport" runat="server" Width="100%" DataKeyNames="Emp_Id,Id"
            AutoGenerateColumns="false" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A"
            OnRowCancelingEdit="GrdEmployeeTracReport_RowCancelingEdit" OnRowEditing="GrdEmployeeTracReport_RowEditing"
            OnRowUpdating="GrdEmployeeTracReport_RowUpdating">
            <Columns>
                <%-- <asp:BoundField HeaderText="Date" DataField="ADate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField HeaderText="Swipe-In" DataField="SwipeIn" DataFormatString="{0:hh:mm:ss tt}" />--%>
                <%-- <asp:BoundField HeaderText="Swipe-Out" DataField="SwipeOut" DataFormatString="{0:hh:mm:ss tt}" />--%>
                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ADate" runat="server" Text='<%#string.Format("{0:MM/dd/yyyy}", Eval("ADate"))%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Swipe-In">
                    <ItemTemplate>
                        <%#string.Format("{0:hh:mm:ss tt}", Eval("SwipeIn"))%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_SwipeIn" runat="server" Text='<%#string.Format("{0:hh:mm:ss tt}",Eval("SwipeIn"))%>'
                            Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqSwipeIn" ControlToValidate="txt_G_SwipeIn"
                            ValidationGroup="rfv" Display="Dynamic" ErrorMessage="*" />
                        <asp:RegularExpressionValidator ID="regexSwipeIn" runat="server" ErrorMessage="invalid time format"
                            ValidationGroup="rfv" Display="Dynamic" ControlToValidate="txt_G_SwipeIn" ValidationExpression="^(([0]?[1-9])|([1][0-2])):(([0-5][0-9])|([1-9])):([0-5][0-9]) [AP][M]$" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Swipe-Out">
                    <ItemTemplate>
                        <%#string.Format("{0:hh:mm:ss tt}", Eval("SwipeOut"))%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_SwipeOut" runat="server" Text='<%#string.Format("{0:hh:mm:ss tt}",Eval("SwipeOut"))%>'
                            Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqSwipeOut" ControlToValidate="txt_G_SwipeOut"
                            ValidationGroup="rfv" Display="Dynamic" ErrorMessage="*" />
                        <asp:RegularExpressionValidator ID="regexSwipeOut" runat="server" ErrorMessage="invalid time format"
                            ValidationGroup="rfv" Display="Dynamic" ControlToValidate="txt_G_SwipeOut" ValidationExpression="^(([0]?[1-9])|([1][0-2])):(([0-5][0-9])|([1-9])):([0-5][0-9]) [AP][M]$" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <ItemTemplate>
                        <%#Eval("Comments")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_Comments" runat="server" Text='<%#Eval("Comments")%>' Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfv_txt_G_Comments" ControlToValidate="txt_G_Comments"
                            ValidationGroup="rfv" ErrorMessage="*" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CommandName="Update"
                            ValidationGroup="rfv" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
