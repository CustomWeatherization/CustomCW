<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Photo_Page_Manage.aspx.cs" Inherits="METED_METED_Photo_Page_Manage"
    Title="Photo Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .InputBox
        {
            border: 1px solid #c7c7c7;
            background-color: #fff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: Black;
            border-radius: 5px;
            padding: 5px 5px;
            width: 253px;
            margin: 0 0 5px 0;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
    <link rel="Stylesheet" type="text/css" href="CSS/uploadify.css" />

    <script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="scripts/jquery.uploadify.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="scrpt_mngr" runat="server">
    </asp:ScriptManager>--%>
    <div class="fontbold">
        <h1 align="center" style="color: Black;">
            Insert The Image For Job's</h1>
        <asp:HiddenField ID="hdnJob" runat="server" />
        <asp:HiddenField ID="hdnInv" runat="server" />
        <div style="text-align: right;">
            <asp:LinkButton ID="lnkBtn_back" runat="server" Text="Back" CssClass="top_btn" OnClick="lnkBtn_back_Click"></asp:LinkButton>
        </div>
        <table width="100%">
            <tr>
                <td align="right">
                    <b>Title :</b>
                </td>
                <td>
                    <asp:TextBox ID="txt_title" runat="server" class="InputBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_txt_title" runat="server" ControlToValidate="txt_title"
                        ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    <b>Image :</b>
                </td>
                <td>
                    <%--<asp:FileUpload ID="fileUP_Image" runat="server" multiple="multiple" />class="multi"--%>
                    <%-- <input id="fileUP_Image" runat="server" type="file" multiple="multiple" />
                    <asp:RequiredFieldValidator ID="rfv_fileUP_Image" runat="server" ControlToValidate="fileUP_Image"
                        ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>--%>
                    <asp:FileUpload ID="FileUpload1" runat="server" Style="display: none;" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    <b>Description :</b>
                </td>
                <td>
                    <asp:TextBox ID="txt_Description_Line1" runat="server" class="InputBox" TextMode="MultiLine"
                        Height="100px" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_txt_Description_Line1" runat="server" ControlToValidate="txt_Description_Line1"
                        ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                    <%--<br />
                <asp:TextBox ID="txt_Description_Line2" runat="server" class="InputBox"></asp:TextBox><br />
                <asp:TextBox ID="txt_Description_Line3" runat="server" class="InputBox"></asp:TextBox>--%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <b>Order No :</b>
                </td>
                <td>
                    <asp:TextBox ID="txt_Order" runat="server" class="InputBox" MaxLength="2"></asp:TextBox>
                    <ajx:FilteredTextBoxExtender ID="fltr_txt_Order" runat="server" FilterType="Numbers"
                        TargetControlID="txt_Order">
                    </ajx:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <a href="javascript:$('#<%=FileUpload1.ClientID%>').fileUploadStart()" class="top_btn">
                        Submit</a>&nbsp;
                    <asp:Button ID="btn_Submit" runat="server" Text="Submit" ValidationGroup="rfv" Visible="false"
                        OnClick="btn_Submit_Click" CssClass="top_btn" />
                    <asp:Button ID="btn_Reset" runat="server" Text="Reset" CssClass="top_btn" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div class="grid_Photo">
            <asp:GridView ID="grd_Image" runat="server" AutoGenerateColumns="false" BorderStyle="None"
                AllowPaging="true" DataKeyNames="ID,PhotoName" Width="100%" BorderWidth="0" PageSize="6"
                OnRowCancelingEdit="grd_Image_RowCancelingEdit" OnRowDeleting="grd_Image_RowDeleting"
                OnRowEditing="grd_Image_RowEditing" OnRowUpdating="grd_Image_RowUpdating" OnPageIndexChanging="grd_Image_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Photo Title">
                        <ItemTemplate>
                            <%#Eval("PhotoTitle")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_G_Title" runat="server" Text='<%#Eval("PhotoTitle")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_txt_G_Title" runat="server" ControlToValidate="txt_G_Title"
                                ErrorMessage="*" ValidationGroup="grd_rfv"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='../METED/Photo_Page_Images1/<%#Eval("PhotoName")%>' alt="" height="50px"
                                width="50px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUP_G_Image" runat="server" Width="84px" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Photo Description">
                        <ItemTemplate>
                            <%#Eval("PhotoDescription1")%><br />
                            <%--<%#Eval("PhotoDescription2")%><br />
                        <%#Eval("PhotoDescription3")%>--%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_G_Description1" runat="server" Text='<%#Eval("PhotoDescription1")%>'
                                TextMode="MultiLine" Height="40px" Width="330px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_txt_G_Description1" runat="server" ControlToValidate="txt_G_Description1"
                                ErrorMessage="*" ValidationGroup="grd_rfv"></asp:RequiredFieldValidator><br />
                            <%--  <asp:TextBox ID="txt_G_Description2" runat="server" Text='<%#Eval("PhotoDescription2")%>'></asp:TextBox><br />
                    <asp:TextBox ID="txt_G_Description3" runat="server" Text='<%#Eval("PhotoDescription3")%>'></asp:TextBox>--%>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order No">
                        <ItemTemplate>
                            <%#Eval("PhotoOrderNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_G_OrderNo" runat="server" Text='<%#Eval("PhotoOrderNo")%>' Width="50px"
                                MaxLength="2"></asp:TextBox>
                            <ajx:FilteredTextBoxExtender ID="fltr_txt_G_Order" runat="server" FilterType="Numbers"
                                TargetControlID="txt_G_OrderNo">
                            </ajx:FilteredTextBoxExtender>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkBtn_Edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                            <asp:LinkButton ID="lnkBtn_Delete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkBtn_Update" runat="server" Text="Update" CommandName="Update"
                                ValidationGroup="grd_rfv"></asp:LinkButton>
                            <asp:LinkButton ID="lnkBtn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <script type="text/javascript">
        $(window).load(
    function() {
        $("#<%=FileUpload1.ClientID %>").fileUpload({
            'formData': { 'someKey': 'someValue', 'someOtherKey': 1 },
            'uploader': 'scripts/uploader.swf',
            'cancelImg': 'images/cancel.png',
            'buttonText': 'Browse Files',
            'script': 'Upload.ashx?dev=' + $("#<%=txt_title.ClientID %>")[0].value,
            'folder': 'uploads',
            'fileDesc': 'Image Files',
            'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
            'multi': true,
            'auto': false,
            onComplete: function(evt, queueID, fileObj, response, data) {
                //alert($("#<%=txt_title.ClientID %>").val());
                $.ajax({
                    type: "POST",
                    url: "METED_Photo_Page_Manage.aspx/GetCurrentTime",
                    data: '{title: "' + $("#<%=txt_title.ClientID%>")[0].value + '",desc: "' + $("#<%=txt_Description_Line1.ClientID%>")[0].value + '",orderno: "' + $("#<%=txt_Order.ClientID%>")[0].value + '",jobno: "' + $("#<%=hdnJob.ClientID%>")[0].value + '",Inv: "' + $("#<%=hdnInv.ClientID%>")[0].value + '"}',  //hdnInv, description: "' + $("<%=txt_Description_Line1.ClientID%>")[0].value + '", orderno: "' + $("<%=txt_Order.ClientID%>")[0].value + '" 
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(response) { window.location = response.d; }, // OnSuccess,
                    failure: function(response) { }
                });
                //end  hdnJob
            }
        });
    }
);
    </script>

    <script type="text/javascript">

        $(function() {
            document.getElementById('PagePhoto').classList.add("ui-selected");
        });
        
    </script>

    <script type="text/javascript">
        document.getElementById("PagePhoto").setAttribute("class", "ui-selected");
    </script>

</asp:Content>
