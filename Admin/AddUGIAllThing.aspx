<%@ Page Title="UGI All Thing" Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true" CodeFile="AddUGIAllThing.aspx.cs" Inherits="AddUGIAllThing" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <br />
    <br />
    <br />
    <h1 align="center">Add UGI All Thing</h1>
    <br />
    <fieldset style="width: 44%; margin-left: 245px;">
        <legend>Set Labor Rate </legend>
        <table>
            <tr>
                <td>
                    <strong>Labor Rate: </strong>
                </td>
                <td>
                    <strong>Min:</strong>
                    <asp:TextBox ID="txt_MinLaborRate" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 100px;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_txt_MinLaborRate" runat="server" ErrorMessage="*"
                        Display="Dynamic" ControlToValidate="txt_MinLaborRate" ValidationGroup="rfvLabor"></asp:RequiredFieldValidator>
                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txt_MinLaborRate" runat="server" TargetControlID="txt_MinLaborRate"
                        FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars=" .">
                    </ajaxToolkit:FilteredTextBoxExtender>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Max:</strong>
                    <asp:TextBox ID="txt_MaxLaborRate" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 100px;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_txt_MaxLaborRate" runat="server" ErrorMessage="*"
                        Display="Dynamic" ControlToValidate="txt_MaxLaborRate" ValidationGroup="rfvLabor"></asp:RequiredFieldValidator>
                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txt_MaxLaborRate" runat="server" TargetControlID="txt_MaxLaborRate"
                        FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars=" .">
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <asp:HiddenField ID="hdn_txt_MinLaborRate" runat="server" />
                    <asp:HiddenField ID="hdn_txt_MaxLaborRate" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btn_UpdateLaborRate" runat="server" Text="Update" class="top_btn"
                        ValidationGroup="rfvLabor" Style="margin-left: 80px;" OnClick="btn_UpdateLaborRate_Click" />
                </td>
            </tr>
        </table>
    </fieldset>
    <br />
    <table align="center">
        <tr>
            <td>
                <strong>Category: </strong>
            </td>
            <td>
                <asp:DropDownList ID="DDl_Category" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 318px;"
                    MaxLength="40" AutoPostBack="true" OnSelectedIndexChanged="DDl_Category_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_DDl_Category" runat="server" ErrorMessage="*"
                    InitialValue="Select" ControlToValidate="DDl_Category" Display="Dynamic" ValidationGroup="rfv"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>MEASURE DESCRIPTION: </strong>
            </td>
            <td>
                <asp:DropDownList ID="DDl_MEASURE_DESCRIPTION" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 318px;"
                    MaxLength="40">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFV_DDl_MEASURE_DESCRIPTION" runat="server" ErrorMessage="*"
                    InitialValue="Select" ControlToValidate="DDl_MEASURE_DESCRIPTION" Display="Dynamic"
                    ValidationGroup="rfv"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="100%">
                    <tr>
                        <td>
                            <strong style="display: none;">Location: </strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Location" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                MaxLength="40" Visible="false"></asp:TextBox>
                        </td>
                        <td>
                            <strong>S/C: </strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_SC" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                MaxLength="40" onkeyup="CalculateLineSC()"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Liurp Code: </strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Liurp" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                MaxLength="40"></asp:TextBox>
                        </td>
                        <td>
                            <strong>Unit: </strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Unit" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Labor Rate: </strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_LaborRate" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                MaxLength="40" onkeyup="CalculateLineLaborRate()"></asp:TextBox>
                        </td>
                        <td>
                            <strong>Cost Per Unit:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_CPU" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnSave" runat="server" Text="Save" class="top_btn" Style="margin-left: 70px;"
                    OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="top_btn" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <br />
     <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional"  runat="server">
                 <ContentTemplate>
    <div style="float: right;">
        <strong>Page Size:&nbsp;</strong>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="15" Value="15"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
            <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <br />
    <div class="rounded_corners" style="width: 100%;">
        <asp:GridView ID="grdAllThing" runat="server" Width="100%" DataKeyNames="RowId" AllowPaging="true"
            PageSize="10" AutoGenerateColumns="false" OnRowUpdating="grdAllThing_RowUpdating"
            OnRowDeleting="grdAllThing_RowDeleting" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A"
            OnRowCancelingEdit="grdAllThing_RowCancelingEdit" OnRowEditing="grdAllThing_RowEditing"
            OnPageIndexChanging="grdAllThing_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <%#Eval("Category")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Subcategory">
                    <ItemTemplate>
                        <%#Eval("SubCatName")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="S/C">
                    <ItemTemplate>
                        <%#Eval("SC")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_SC" runat="server" Text='<%#Eval("SC")%>' Width="15px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Liurp Code">
                    <ItemTemplate>
                        <%#Eval("liurpCode")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_liurpCode" runat="server" Text='<%#Eval("liurpCode")%>' Width="50px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Unit">
                    <ItemTemplate>
                        <%#Eval("unit")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_unit" runat="server" Text='<%#Eval("unit")%>' Width="50px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Labor Rate">
                    <ItemTemplate>
                        <%#Eval("laborRate")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_laborRate" runat="server" Text='<%#Eval("laborRate")%>' Width="55px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cost Per Unit">
                    <ItemTemplate>
                        <%#Eval("costPerUnit")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_costPerUnit" runat="server" Text='<%#Eval("costPerUnit")%>'
                            Width="60px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnk_Edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Delete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this Record?');"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="Lnk_Update" runat="server" Text="Update" CommandName="Update"
                            ValidationGroup="rfv_G"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Cancel" runat="server" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</ContentTemplate>
</asp:UpdatePanel>
    <script type="text/javascript">

        function CalculateLineLaborRate() {
            var Min = document.getElementById('<%=hdn_txt_MinLaborRate.ClientID %>').value;
            var Max = document.getElementById('<%=hdn_txt_MaxLaborRate.ClientID %>').value;
            var len = document.getElementById('<%=txt_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=txt_LaborRate.ClientID %>').value == '') {
                alert('Labor Rate can only be ' + Min + ' or ' + Max + '.');
            }
            else if (document.getElementById('<%=txt_LaborRate.ClientID %>').value == Min + '/' + Max) {
                alert('Labor Rate can only be ' + Min + ' or ' + Max + '.');
            }
            else if (len == 2) {
                if (document.getElementById('<%=txt_LaborRate.ClientID %>').value != Min && document.getElementById('<%=txt_LaborRate.ClientID %>').value != Max) {
                    alert('Labor Rate can only be ' + Min + ' or ' + Max + '.');
                    document.getElementById('<%=txt_LaborRate.ClientID %>').value = '';
                }
            }
            else {
            }
}


function CalculateLineSC() {

    var SC = document.getElementById('<%=txt_SC.ClientID %>').value;
    if (SC != '') {
        if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
            alert('SC must be set to either  S  or  C  or  R  or  SC . ');
            document.getElementById('<%=txt_SC.ClientID %>').value = '';
        }
        else {
            document.getElementById('<%=txt_SC.ClientID %>').value = SC;
        }
    }
    else {
        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
        document.getElementById('<%=txt_SC.ClientID %>').value = '';
    }

}


    </script>
</asp:Content>

