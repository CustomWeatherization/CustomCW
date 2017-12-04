<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    CodeFile="ContactAttemptsReport.aspx.cs" Inherits="ContactAttemptsReport" Title="Contact Attempts" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .grid table th
        {
            text-align: left !important;
        }
        .logo-1
        {
            display: none;
        }
        .ajax__calendar_days table tr td{ padding:0;}
        @media print
        {
            .grid th
            {
                padding: 5px 0 !important;
            }
            .logo-1
            {
                display: block;
                margin-left: 400px;
                margin-bottoms: 15px;
            }
            .header
            {
                display: none;
            }
            .jobstatus
            {
                display: none;
            }
            .btmsubmit
            {
                display: none;
            }
            .contrepdetails table
            {
                border-collapse: collapse;
                font-size: 14px;
                margin-left: 50px;
                margin-top: 15px;
            }
            .footer
            {
                border-top: none;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jobstatus">
        <h1>
            Contact Attempts Report (Job Number:
            <%=Request.QueryString["jobs"].ToString() %>)</h1>
        <p>
            To Insert a new contact attempt fill in all fields accurately and click the Save
            button.</p>
        <p>
            To Insert a master comment for the entire job enter text in the box at the bottom
            of the page and click the Save Comments Button on the top right.</p>
        <div class="contrep">
            <table border="0" cellspacing="0" cellpadding="0" >
                <tr>
                    <th>
                        Date
                    </th>
                    <th>
                        Time
                    </th>
                    <th>
                        Contact Type
                    </th>
                    <th>
                        Contact Person
                    </th>
                    <th>
                        Resech Contact Result
                    </th>
                    <th>
                        Contact Result Date
                    </th>
                </tr>
                <tr>
                    <td style="width:13%;">
                        <asp:TextBox ID="txtDate_ContactAttempt" runat="server" style="width:77%"></asp:TextBox>
                    </td>
                    <td style="width:13%;">
                        <asp:TextBox ID="txtTime_ContactAttempt" runat="server" style="width:77%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlContactType" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlContactType"
                                                            InitialValue="0" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlContactPerson" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlContactPerson"
                                                            InitialValue="0" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlContactResult" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlContactResult"
                                                            InitialValue="0" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width:13%;">
                    <%-- <ajaxToolkit:ToolkitScriptManager runat=server></ajaxToolkit:ToolkitScriptManager>--%>
                    <asp:TextBox ID="txtDate_Result" runat="server" Width="90%" style="width:77%"></asp:TextBox>
                     <ajaxToolkit:CalendarExtender ID="CalendarExtender10" runat="server" TargetControlID="txtDate_Result">
                     </ajaxToolkit:CalendarExtender>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDate_Result"  Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
            </table>
      
        </div>
        <div class="btmsubmit">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click1" class="btn_all" ValidationGroup="G"/>&nbsp;
        </div>
    </div>
    <div class="clear">
    </div>
    <!--Print Code-->
    <div id="DivPrint" style="text-align: left !important;">
        <div class="contrepdetails" style="text-align: center;">
            <img src="images/logo.jpg" class="logo-1">
            <h3 style="text-align: center; margin-top: 15px;">
                CUSTOM WEATHERIZATION, LLC Contact Attempts Report</h3>
            <h5 style="text-align: center">
                Customer Job Number:
                <%=Request.QueryString["jobs"].ToString() %>
            </h5>
            <% if (dt1 != null)
               {
                   if (dt1.Rows.Count > 0)
                   {
            %>
            <table width="45%" border="0" cellspacing="0" cellpadding="0" style="float: left;
                margin-left: 70px;">
                <tr align="left">
                    <td width="100px">
                        Customer Name:
                    </td>
                    <td width="150px">
                        <%=dt1.Rows[0]["FullName"].ToString()%>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        Customer Home Phone:
                    </td>
                    <td>
                        <%=dt1.Rows[0]["HomePhone"].ToString()%>
                    </td>
                </tr>
            </table>
            <table width="40%" border="0" cellspacing="0" cellpadding="0" style="float: right;">
                <%--<tr>
                    
                </tr>
                <tr>
                    <td>
                        Customer Address2:
                    </td>
                    <td>
                        <%=dt.Rows[0]["Address2"].ToString()%>
                    </td>
                </tr>--%>
                <tr align="left">
                    <td>
                        Customer Cell Phone:
                    </td>
                    <td>
                        <%=dt1.Rows[0]["CellPhone"].ToString()%>
                    </td>
                </tr>
                <tr align="left">
                    <td width="100px">
                        Customer Address:
                    </td>
                    <td width="100px">
                        <%=dt1.Rows[0]["Address1"].ToString()%>
                    </td>
                </tr>
            </table>
            <%}
               } %>
        </div>
        <br />
        <div class="grid" style="margin-top: 25px;">
            <asp:GridView ID="grdContactAttempts" runat="server" AutoGenerateColumns="false"
                DataKeyNames="JobNumber" Width="100%" BorderColor="Transparent" GridLines="None"
                align="left" Style="text-align: left;">
                <Columns>
                    <asp:TemplateField HeaderText="Contact Date">
                        <ItemTemplate>
                            <%# ((DateTime)Eval("ContactDateTime")).ToString("MM/dd/yyyy")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Time">
                        <ItemTemplate>
                            <%# ((DateTime)Eval("ContactDateTime")).ToString("HH:mm:ss tt")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Type">
                        <ItemTemplate>
                            <%#Eval("ContactType")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Person">
                        <ItemTemplate>
                            <%#Eval("ContactPerson")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Result">
                        <ItemTemplate>
                            <%#Eval("ContactResult")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Contact Result Date">
                        <ItemTemplate>
                        <%# Eval("ContactResultDate") == DBNull.Value? " - " : Convert.ToString(Convert.ToDateTime(Eval("ContactResultDate")))%>
                        
                        </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <h4 style="float: left; width: 100%;">
                Comments</h4>
            <div align="center">
                <asp:TextBox ID="txtComments" runat="server" Style="color: Black;" TextMode="MultiLine"
                    Columns="150" Rows="15"></asp:TextBox>
            </div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
    </div>
    <!--Print End-->
    <div class="clear">
    </div>
    <div class="btmsubmit">
        <asp:Button ID="btnSaveComments" runat="server" Text="Save Comments" OnClick="btnSaveComments_Click"
            class="btn_all" />&nbsp;
        <asp:Button ID="btnPrint" runat="server" Text="Print" class="btn_all" OnClientClick="ClickHereToPrintFull();" />&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
            class="btn_all" />
    </div>

    <script type="text/javascript">
        //        function ClickHereToPrintFull() {
        //            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
        //            disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
        //            var content_vlue = document.getElementById('DivPrint').innerHTML;
        //            var docprint = window.open("", "", disp_setting);
        //            docprint.document.open();
        //            docprint.document.write('<html><head><title>Custom Weatherization</title> ');
        //            docprint.document.write('</head><body onLoad="self.print()"><center>');
        //            docprint.document.write(content_vlue);
        //            docprint.document.write('</center></body></html>');
        //            docprint.document.close();
        //            docprint.focus();
        //        }

        function ClickHereToPrintFull() {
            window.print();
        }
    </script>

</asp:Content>
