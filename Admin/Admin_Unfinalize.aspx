<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="Admin_Unfinalize.aspx.cs" Inherits="Admin_Admin_Unfinalize" Title="Custom Weatherization/ Unfinalize Job" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <fieldset style="display: none;">
        <legend>Job UnFinalize </legend>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td width="20%">
                        Enter JobNumber To UnFinalize
                    </td>
                    <td align="center" width="25%">
                        <asp:TextBox ID="JobNumber" runat="server" MaxLength="50"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                            TargetControlID="JobNumber" FilterType="Custom" ValidChars="1234567890">
                        </ajaxToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RFJobNumber" runat="server" ControlToValidate="JobNumber"
                            Display="Dynamic" ValidationGroup="NewSubmit" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RExptxtJobNew" runat="server" ValidationGroup="NewSubmit"
                            Display="Dynamic" ControlToValidate="JobNumber" ErrorMessage="Input is not valid."
                            ValidationExpression="^(?=.*[1-9])(?:[1-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:Button ID="btn_unfinalize" runat="server" Text="Click Here to UnFinalize This Job"
                            class="btn_all" ValidationGroup="NewSubmit" Width="270px" OnClick="btn_unfinalize_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
    <br />
    <br />
    <fieldset style="display: none;">
        <legend>Change Job Type</legend>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td>
                        <asp:TextBox ID="txtChangeJobType" runat="server" MaxLength="50" placeholder="Enter Job Number"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="fltrtxtChangeJobType" runat="server" TargetControlID="txtChangeJobType"
                            FilterType="Custom" ValidChars="1234567890">
                        </ajaxToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="rfvtxtChangeJobType" runat="server" ControlToValidate="txtChangeJobType"
                            Display="Dynamic" ValidationGroup="JobType" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rglrtxtChangeJobType" runat="server" ValidationGroup="JobType"
                            Display="Dynamic" ControlToValidate="txtChangeJobType" ErrorMessage="Input is not valid."
                            ValidationExpression="^(?=.*[1-9])(?:[1-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAct129" runat="server" onclick="ChkAct129(this.id);" />
                        Act 129
                        <asp:CheckBox ID="chkBaseLoad" runat="server" onclick="ChkOtherJobType(this.id);" />
                        BaseLoad Only
                        <asp:CheckBox ID="chkHighPriority" runat="server" onclick="ChkOtherJobType(this.id);" />
                        High Priority
                        <asp:CheckBox ID="chkLowCost" runat="server" onclick="ChkOtherJobType(this.id);" />
                        Low Cost
                        <asp:CheckBox ID="chkFullCost" runat="server" onclick="ChkOtherJobType(this.id);" />
                        Full Cost<br />
                        <asp:CheckBox ID="chkAct129II" runat="server" onclick="ChkAct129II(this.id);" />
                        Act 129 II
                    </td>
                    <td>
                        <asp:Button ID="btnChange" runat="server" Text="Change" class="btn_all" ValidationGroup="JobType"
                            Width="125px" OnClick="btnChange_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
    <fieldset>
        <div>
            <asp:TextBox ID="txt_SubmitDate" runat="server" Placeholder="Submit Date" Style="border: 1px solid #ccc;
                font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #717171; border-radius: 5px;
                padding: 8px; width: 110px; margin: 10px 0 5px 0;"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="ajxClndr" runat="server" TargetControlID="txt_SubmitDate">
            </ajaxToolkit:CalendarExtender>
            <asp:Button ID="btnSubmitDate" runat="server" class="btn_all" Style="width: 97px;"
                Text="Submit Date" OnClick="btnSubmitDate_Click" />
        </div>
        <div class="btm_box1">
            <asp:Panel ID="PanelAdvanceSearch" runat="server">
                <div class="divalign" style="margin-left: 50%;">
                    <br />
                    <table>
                        <tr>
                            <td align="center">
                                <h1>
                                    Find A Job
                                </h1>
                                <asp:TextBox ID="txtJobNumber" runat="server" Placeholder="Job Number" onchange="getfocus();"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnfind" runat="server" Text="Find" class="btn_all" Width="25%" OnClick="btnfind_Click" />&nbsp;&nbsp;
                                <asp:Button ID="btnDeleteJob" runat="server" Text="Find Invoice" class="btn_all"
                                    Width="37%" OnClick="btnDeleteJob_Click" />
                                <asp:Button ID="BtnAudit" runat="server" Text="Find Audit" class="btn_all" Width="37%"
                                    Visible="false" OnClick="BtnAudit_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
    </fieldset>
    <br />
    <div class="rounded_corners" style="width: 100%;">
        <asp:GridView ID="grdJobAudit" runat="server" Width="100%" AutoGenerateColumns="false"
            Visible="false" EmptyDataText="No Record !!" DataKeyNames="JobNumber" PageSize="10"
            AllowPaging="true" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A"
            OnRowDeleting="grdJobAudit_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="No Of Invoice">
                    <ItemTemplate>
                        Audit is Exists
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnk_Delete" CommandName="Delete" runat="server" Text="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this Invoice?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="rounded_corners" style="width: 100%;">
        <asp:GridView ID="grdshowJob" runat="server" Width="100%" AutoGenerateColumns="false"
            EmptyDataText="No Record !!" DataKeyNames="JobNumber,NoOfInvoice" PageSize="10"
            AllowPaging="true" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A"
            OnRowDeleting="grdshowJob_RowDeleting" OnRowEditing="grdshowJob_RowEditing" OnRowCancelingEdit="grdshowJob_RowCancelingEdit"
            OnRowUpdating="grdshowJob_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="No Of Invoice">
                    <ItemTemplate>
                        Invoice -&nbsp;<%#Eval("NoOfInvoice")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Account No">
                    <ItemTemplate>
                        <%#Eval("AccountNumber")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone No">
                    <ItemTemplate>
                        <%#Eval("HomePhone")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="Submit Date">
                    <ItemTemplate>
                        <%# Eval("SubmitDate", "{0:MM/dd/yyyy}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_SubmitDate" runat="server" Text='<%# SetWedDate(Eval("SubmitDate"))%>'></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="ajxClndr" runat="server" TargetControlID="txt_G_SubmitDate">
                        </ajaxToolkit:CalendarExtender>
                    </EditItemTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnk_Delete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this Invoice?');"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Edit" runat="server" Text="Edit" CommandName="Edit" Visible="false"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnk_Update" runat="server" Text="Update" CommandName="Update"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Cancel" runat="server" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="rounded_corners" style="width: 100%;">
        <asp:GridView ID="GrdShowJobNumber" runat="server" Width="100%" AutoGenerateColumns="false"
            Visible="false" EmptyDataText="No Record !!" DataKeyNames="JobNumber" PageSize="10"
            AllowPaging="true" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A"
            OnRowDeleting="GrdShowJobNumber_RowDeleting" OnRowDataBound="GrdShowJobNumber_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Job Number">
                    <ItemTemplate>
                        <%#Eval("JobNumber") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:HiddenField ID="HdnJobTypeVendor" runat="server" Value='<%#Eval("JobVendor") %>' />
                        <asp:HyperLink ID="hyprLnkUrlOther" runat="server" Text="Edit" NavigateUrl='<%# string.Format("../AddNewJob.aspx?Back=Admin/Admin_Unfinalize&Jobs={0}&UC={1}",HttpUtility.UrlEncode(Eval("JobNumber").ToString()), HttpUtility.UrlEncode(Eval("UtilityCompany").ToString())) %>'></asp:HyperLink>
                        <asp:HyperLink ID="hyprLnkUrlVendor" runat="server" Text="Edit" NavigateUrl='<%# string.Format("../AddNewJob.aspx?Back=Admin/Admin_Unfinalize&GT=Vendor&InvoiceNo=1&Jobs={0}",HttpUtility.UrlEncode(Eval("JobNumber").ToString()))%>'></asp:HyperLink>
                        <asp:HyperLink ID="hyprLnkUrlVendorInv" runat="server" Text="Edit" NavigateUrl='<%# string.Format("../Vendor/VendorInvoice.aspx?Back=Admin/Admin_Unfinalize&GT=Vendor&Jobs={0}",HttpUtility.UrlEncode(Eval("JobNumber").ToString()))%>'></asp:HyperLink>
                        <%--<a href="../AddNewJob.aspx?Back=Admin/Admin_Unfinalize&Jobs=<%#Eval("JobNumber") %>&UC=<%#Eval("UtilityCompany") %>">
                            Edit</a>--%>
                        <asp:LinkButton ID="lnk_Delete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this Invoice?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
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
                document.getElementById('<%= chkBaseLoad.ClientID %>').checked = false;
                document.getElementById('<%= chkHighPriority.ClientID %>').checked = false;
                document.getElementById('<%= chkLowCost.ClientID %>').checked = false;
                document.getElementById('<%= chkFullCost.ClientID %>').checked = false;
                document.getElementById('<%= chkAct129II.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ChkOtherJobType(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                CheckBox.checked = false;
                document.getElementById('<%= chkAct129II.ClientID %>').checked = false;
                CheckBox.checked = true;

            }
        }
        function getfocus() {
            document.getElementById('<%=btnfind.ClientID%>').focus();
        }
    </script>

</asp:Content>
