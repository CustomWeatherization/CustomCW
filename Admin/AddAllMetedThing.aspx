<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="AddAllMetedThing.aspx.cs" Inherits="Admin_AddAllMetedThing" Title="METED All Thing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <h1 align="center">
        Add All Met-Ed Thing</h1>
    <br />
    <fieldset style="width: 28%; margin-left: 332px;">
        <legend>Set Labor Rate </legend>
        <table width="100%">
            <tr>
                <td align="center">
                    <strong>Labor Rate: </strong>
                    <asp:TextBox ID="txt_MinLaborRate" runat="server" Style="border: 1px solid #ccc;
                        font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                        padding: 8px; margin: 0; width: 100px;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_txt_MinLaborRate" runat="server" ErrorMessage="*"
                        Display="Dynamic" ControlToValidate="txt_MinLaborRate" ValidationGroup="rfvLabor"></asp:RequiredFieldValidator>
                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txt_MinLaborRate" runat="server" TargetControlID="txt_MinLaborRate"
                        FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars=" .">
                    </ajaxToolkit:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td align="center">
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
                <asp:DropDownList ID="DDl_Category" runat="server" Style="border: 1px solid #ccc;
                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                    padding: 8px; margin: 0; width: 318px;" MaxLength="40" AutoPostBack="true" OnSelectedIndexChanged="DDl_Category_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_DDl_Category" runat="server" ErrorMessage="*"
                    InitialValue="Select" ControlToValidate="DDl_Category" Display="Dynamic" ValidationGroup="rfv"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Item: </strong>
            </td>
            <td>
                <asp:DropDownList ID="DDl_Item" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 318px;"
                    MaxLength="40">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFV_DDl_Item" runat="server" ErrorMessage="*" InitialValue="Select"
                    ControlToValidate="DDl_Item" Display="Dynamic" ValidationGroup="rfv"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>Location:-</strong>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtLocation" runat="server"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: black; border-radius: 5px; padding: 8px; margin: 0; width: 193px;" MaxLength="40"></asp:TextBox>
                <strong>Code:-</strong>&nbsp;&nbsp;<asp:TextBox ID="txtCode" runat="server" Style="border: 1px solid #ccc;
                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                    padding: 8px; margin: 0; width: 40px;" MaxLength="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>Cost:-</strong>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtCost" runat="server"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: black; border-radius: 5px; padding: 8px; margin: 0; width: 60px;" MaxLength="10"
                    onkeyup="CalculateMaterial();" onblur="Currency_Format(this.id);"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>THW:-</strong> &nbsp;&nbsp;<asp:TextBox ID="txtTHW" runat="server" Style="border: 1px solid #ccc;
                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                    padding: 8px; margin: 0; width: 60px;" MaxLength="10" onblur="Currency_Format(this.id);"
                    onkeyup="CalculateLabor();"></asp:TextBox>&nbsp;&nbsp; <strong>T/W:-</strong>
                &nbsp;&nbsp;<asp:TextBox ID="txtTW" runat="server" Style="border: 1px solid #ccc;
                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                    padding: 8px; margin: 0; width: 50px;" MaxLength="10" onblur="Currency_Format(this.id);"
                    onkeyup="CalculateLabor();"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>Labor:-</strong>
                <asp:TextBox ID="txtLabor" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 60px;"
                    MaxLength="10" onkeyup="CalculateMaterial();" onblur="Currency_Format(this.id);"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                <strong>Material:-</strong>
                <asp:TextBox ID="txtMaterial" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 60px;"
                    MaxLength="10" onkeyup="CalculateMaterial();" onblur="Currency_Format(this.id);"></asp:TextBox>
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
        <asp:GridView ID="grdAllMetedThing" runat="server" Width="100%" DataKeyNames="RowId"
            AllowPaging="true" PageSize="10" AutoGenerateColumns="false" HeaderStyle-BackColor="#3AC0F2"
            HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
            RowStyle-ForeColor="#3A3A3A" OnPageIndexChanging="grdAllMetedThing_PageIndexChanging"
            OnRowCancelingEdit="grdAllMetedThing_RowCancelingEdit" OnRowDeleting="grdAllMetedThing_RowDeleting"
            OnRowEditing="grdAllMetedThing_RowEditing" OnRowUpdating="grdAllMetedThing_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <%#Eval("Category")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <%#Eval("Location")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_Location" runat="server" Text='<%#Eval("Location")%>' Width="40px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code">
                    <ItemTemplate>
                        <%#Eval("Code")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_Code" runat="server" Text='<%#Eval("Code")%>' Width="40px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Subcategory">
                    <ItemTemplate>
                        <%#Eval("SubCatName")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <%#Eval("Discription")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="THW">
                    <ItemTemplate>
                        <%#Eval("THW")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_THW" runat="server" Text='<%#Eval("THW")%>' Width="40px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="T/W">
                    <ItemTemplate>
                        <%#Eval("TW")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_TW" runat="server" Text='<%#Eval("TW")%>' Width="40px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cost">
                    <ItemTemplate>
                        <%#Eval("Cost")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_Cost" runat="server" Text='<%#Eval("Cost")%>' Width="40px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Labor">
                    <ItemTemplate>
                        <%#Eval("Labor")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_Labor" runat="server" Text='<%#Eval("Labor")%>' Width="40px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Material">
                    <ItemTemplate>
                        <%#Eval("Material")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_Material" runat="server" Text='<%#Eval("Material")%>' Width="50px"></asp:TextBox>
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

        function CalculateMaterial() {
            var cost = document.getElementById('<%=txtCost.ClientID %>').value;
            cost = cost.replace(/,/g, "");
            var labor = document.getElementById('<%=txtLabor.ClientID %>').value;
            labor = labor.replace(/,/g, "");
            if (cost == '') {
                cost = '0';
            }
            if (labor == '') {
                labor = '0';
            }
            var material = parseFloat(cost) - parseFloat(labor);
            document.getElementById('<%=txtMaterial.ClientID %>').value = material.toFixed(2);
            CalculateTotal();
        }


        function CalculateTotal() {
            var labor = document.getElementById('<%=txtLabor.ClientID %>').value;
            labor = labor.replace(/,/g, "");
            var material = document.getElementById('<%=txtMaterial.ClientID %>').value;
            material = material.replace(/,/g, "");
            var qty = '1.00';
            qty = qty.replace(/,/g, "");
            if (labor == '') {
                labor = '0';
            }
            if (material == '') {
                material = '0';
            }
            if (qty == '') {
                qty = '0';
            }
            var total = parseFloat(labor) + parseFloat(material);
            total = parseFloat(qty) * parseFloat(total);
        }

        function CalculateLabor() {
            var THW = document.getElementById('<%=txtTHW.ClientID %>').value;
            THW = THW.replace(/,/g, "");
            var TW = document.getElementById('<%=txtTW.ClientID %>').value;
            TW = TW.replace(/,/g, "");
            var LaborRate = document.getElementById('<%=txt_MinLaborRate.ClientID %>').value;
            LaborRate = LaborRate.replace(/,/g, "");
            if (THW == '') {
                THW = '0';
            }
            if (TW == '') {
                TW = '0';
            }
            if (LaborRate == '') {
                LaborRate = '0';
            }
            var labor = parseFloat(THW) * parseFloat(TW) * parseFloat(LaborRate);
            document.getElementById('<%=txtLabor.ClientID %>').value = labor.toFixed(2);
            CalculateMaterial(); CalculateTotal();
        }
    </script>

    <script type="text/javascript">
        function CurrencyFormat(number) {
            var decimalplaces = 2;
            var decimalcharacter = ".";
            var thousandseparater = "";
            number = parseFloat(number);
            var sign = number < 0 ? "-" : "";
            var formatted = new String(number.toFixed(decimalplaces));
            if (decimalcharacter.length && decimalcharacter != ".") { formatted = formatted.replace(/\./, decimalcharacter); }
            var integer = "";
            var fraction = "";
            var strnumber = new String(formatted);
            var dotpos = decimalcharacter.length ? strnumber.indexOf(decimalcharacter) : -1;
            if (dotpos > -1) {
                if (dotpos) { integer = strnumber.substr(0, dotpos); }
                fraction = strnumber.substr(dotpos + 1);
            }
            else { integer = strnumber; }
            if (integer) { integer = String(Math.abs(integer)); }
            while (fraction.length < decimalplaces) { fraction += "0"; }
            temparray = new Array();
            while (integer.length > 3) {
                temparray.unshift(integer.substr(-3));
                integer = integer.substr(0, integer.length - 3);
            }
            temparray.unshift(integer);
            integer = temparray.join(thousandseparater);
            return sign + integer + decimalcharacter + fraction;
        }
    </script>

    <script type="text/javascript">
        function Currency_Format(ID) {
            var cost = document.getElementById(ID).value;
            var amt = CurrencyFormat(cost);
            document.getElementById(ID).value = amt;
        }

    </script>

</asp:Content>
