<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/Admin_Master_Page.master"
    AutoEventWireup="true" CodeFile="Occurrences.aspx.cs" Inherits="Admin_Occurrences" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .leaves-tbl
        {
            border: 1px solid #A1DCF2;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            overflow: hidden;
        }
        .leaves-tbl tr th
        {
            padding: 15px 10px;
            border: 1px solid #A1DCF2;
            font-family: Arial;
            font-size: 10pt;
            text-align: center;
            font-style: normal;
        }
        .leaves-tbl tr td
        {
            padding: 15px 10px;
            border: 1px solid #A1DCF2;
            font-family: Arial;
            font-size: 10pt;
            text-align: center;
            font-style: normal;
        }
        .leaves-tbl select
        {
            width: 100%;
            border-radius: 10px;
            padding: 8px;
        }
        .table tr td input, textarea, textbox, select
        {
            padding: 5px 5px;
            border-radius: 5px;
        }
        .msg_count1
        {
            background-color: #ff0000;
            border: 1px solid #ac0000; /* position: absolute; */
            border-radius: 15px;
            font-size: 14px;
            color: #fff;
            top: 0;
            left: 80px;
            padding: 2px 2px;
            min-width: 30px;
            text-align: center;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding: 10px;
            width: 500px;
            height: auto;
        }
        .Background
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .Popup
        {
            padding: 20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            overflow: auto;
            padding-left: 10px;
            width: 800px;
            height: 850px;
            border-radius: 10px;
        }
        .Popup1
        {
            padding: 20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            padding-left: 10px;
            width: 600px;
            height: 220px;
            border-radius: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlOccurenceAdd" runat="server" Visible="false">
                    <div style="text-align: center; width: 100% !important;" class="divalign">
                        <h1 class="assign" style="width: 100% !important;">
                            <b>
                                <asp:Label runat="server" ID="Label2" Text="Occurrence Form"></asp:Label></b>
                            <%--<asp:ImageButton ID="imgBtnCancelOccurence" runat="server" OnClick="btn_cancel_Click" ImageUrl="Admin/images/Cross3.png" Height="35px" Width="35px" style="float: right;margin-right: 20px;"/>--%><asp:LinkButton 
                                ID="lbnViewOccurenceDetails" runat="server" Text="View Occurrences Details"
                                OnClick="lbnOccurrenceOnClick"></asp:LinkButton>
                        </h1>
                    </div>
                    <br />
                    <table class="table" width="100%" border="0" cellspacing="2" cellpadding="2">
                        <tr>
                            <td width="20%">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Employee:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td width="60%">
                                <asp:DropDownList ID="ddlEmployeeName" runat="server" CssClass="textbox77" 
                                    Width="200px">
                                    <%--OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged" AutoPostBack="true"--%>
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="rfv_DDL_AllDates" runat="server" ValidationGroup="G"
                                    ControlToValidate="ddlEmployeeName" ErrorMessage="Select Employee Name" InitialValue="Select Employee"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                    
                            <td width="20%">
Date:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td width="60%">
                                <asp:Label ID="lblOccurenceDate" runat="server" Text="1/1/1900"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Narrative:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td width="60%">
                                <FTB:FreeTextBox ID="txtNarrative" runat="server" Width="600px" Height="100px">
                                </FTB:FreeTextBox>
                                <%--  <asp:TextBox ID="txtNarrative" runat="server" TextMode="MultiLine" Width="500px" Height="80px"></asp:TextBox><br />--%><asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1" runat="server" ValidationGroup="G"
                                    ControlToValidate="txtNarrative" ErrorMessage="Enter Narrative" 
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supervisor Assigned:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td width="60%">
                                <asp:DropDownList ID="ddlSupervisorName" runat="server" CssClass="textbox77" 
                                    Width="200px">
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="G"
                                    ControlToValidate="ddlSupervisorName" ErrorMessage="Select SupervisorName" InitialValue="Select Manager"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Action Taken:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td width="60%">
                                <asp:DropDownList ID="ddlAction" runat="server" CssClass="textbox77" Width="200px"
                                    EnableViewState="true">
                                    <asp:ListItem Text="Select Action" Value="0"></asp:ListItem>
                                     <asp:ListItem Text="For communication Only" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Received a warning" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Received a write-up and notified" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Received a write-up and notified verbally" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="Received a write-up and suspended" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="Suspended without pay. Followed with a probationary period for 90 days."
                                        Value="6"></asp:ListItem>
                                    <asp:ListItem Text="Sent home" Value="7"></asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="G"
                                    ControlToValidate="ddlAction" ErrorMessage="Select Action" 
                                    InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Need To Sign?:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td width="60%">
                                <asp:RadioButtonList ID="rdbSign" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0" Selected="True"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Label ID="lblOccurences" runat="server" 
                                    
                                    
                                    
                                    
                                    
                                    Text="(Signature must be made with-in 1 week to avoid suspension and or termination)"></asp:Label>
                            </td>
                        </tr>
                        <%-- <tr>
                                        <td width="20%">
                                        Response:
                                        </td>
                                        <td width="60%">
                                        <asp:TextBox ID="txtResponse" runat="server" TextMode="MultiLine"  Width="500px" Height="80px"></asp:TextBox><br />
                                         <asp:RequiredFieldValidator  ID="RequiredFieldValidator5" runat="server" ValidationGroup="G"
                                            ControlToValidate="txtResponse" ErrorMessage="Enter Respose"  Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                        </tr>--%><tr>
                            <td width="20%">
                            </td>
                            <td width="60%">
                                <asp:Button ID="btnSubmitOccurences" Text="Submit" runat="server" ValidationGroup="G"
                                    CssClass="BtnPrintHistory btn-submit" 
                                    OnClick="btn_submit_Occurences_Click" />&nbsp;&nbsp;&nbsp;<asp:Button
                                        ID="btnCancel1" Text="Cancel" runat="server" OnClick="btn_occurences_cancel_Click"
                                        CssClass="BtnPrintHistory" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmitOccurences" />
                <asp:PostBackTrigger ControlID="DropDownList1" />
                <asp:PostBackTrigger ControlID="btnCancel1" />
                <asp:PostBackTrigger ControlID="lbnViewOccurenceDetails" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:Panel ID="pnlOccurenceView" runat="server">
            <div style="text-align: center; width: 100% !important;" class="divalign">
                <h1 class="assign" style="width: 100% !important;">
                    <b><asp:Label runat="server" ID="Label1" Text="Occurrences Details"></asp:Label></b>
                    <asp:LinkButton ID="lbtnAddOccurence" runat="server" Text="Add Occurrence" 
                        OnClick="lbtnAddOccurence_Click"></asp:LinkButton>
                    <%-- <asp:ImageButton ID="ImageButton2" runat="server" OnClick="btn_cancelPayment_Click" ImageUrl="Admin/images/Cross3.png" Height="35px" Width="35px" style="float: right;margin-right: 20px;"/>--%></h1>
            </div>
            <br />
            <br />
            <div style="text-align: center; width: 100% !important;" class="divalign">
    Employee:- <asp:DropDownList ID="ddlListEmployee" Style="text-align: center" runat="server" CssClass="textbox77" Width="200px" OnSelectedIndexChanged="ddlListEmployee_SelectedIndexChanged" AutoPostBack="true">
                    <%--OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged" AutoPostBack="true"--%>
                </asp:DropDownList>
            </div>
            <br />
            <div style="float: right; margin-bottom: 10px;" id="div_page" runat="server">
                <strong>Page Size:&nbsp;</strong><asp:DropDownList ID="DropDownList1" 
                    runat="server" AutoPostBack="true" 
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                    <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <div class="rounded_corners" 
                style="width: 100%; overflow: auto; max-height: 500px;">
                <asp:GridView ID="grdOccurences" runat="server" Width="100%" DataKeyNames="OccurrencesID"
                    class="leaves-tbl" AutoGenerateColumns="false" PageSize="10" AllowPaging="true"
                    OnPageIndexChanging="grdOccurences_PageIndexChanging" HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" EmptyDataText="No Request Available" OnRowUpdating="grdOccurences_RowUpdating"
                    OnRowDeleting="grdOccurences_RowDeleting" 
                    OnRowDataBound="grdOccurrence_RowDataBount">
                    <%-- OnRowUpdating="grdOccurences_RowUpdating"--%><RowStyle BackColor="#A1DCF2" 
                        ForeColor="#3A3A3A"></RowStyle>
                    <Columns>
                        <asp:TemplateField HeaderText="Employee Name">
                            <ItemTemplate>
                                <asp:Label ID="lblEmployeeName" runat="server" Text='<%#Eval("EmployeeName")%>'></asp:Label>
                                <asp:Label ID="lblResponseStatus" runat="server" 
                                    Text='<%#Eval("ResponseStatus")%>' 
                                    Visible="false"></asp:Label><%--<%#Eval("ResponseStatus")%>--%><asp:Label 
                                    ID="NeedToSign" runat="server" Text='<%#Eval("NeedToSign")%>' 
                                    Visible="false"></asp:Label>
                            </ItemTemplate>
                              <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Manager Name">
                            <ItemTemplate>
                                <asp:Label ID="lblManagerName" runat="server" Text='<%#Eval("ManagerName")%>'></asp:Label>
                            </ItemTemplate>
                              <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date")%>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Narrative" >
                            <ItemTemplate>
                              
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Limit(Eval("Narrative"), 45)%>'
                                    ToolTip='<%# Eval("Narrative")%>' ></asp:Label>
                               
                                <asp:LinkButton ID="lblReadMore" ForeColor="Blue" runat="server" Text="..Read More"
                                    Visible='<%# SetVisibility(Eval("Narrative"), 45) %>' 
                                    OnClick="ReadMoreLinkButton_Click"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="25%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" >
                            <ItemTemplate>
                                <asp:Label ID="lblActionTaken" runat="server" Text='<%# Eval("ActionTaken")%>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Response">
                            <ItemTemplate>
                                <asp:Label ID="lblResponse" runat="server" Text='<%# Eval("Response")%>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="25%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:ImageButton ID="lnk_Edit" runat="server" ImageUrl="../images/PDF1.png" AlternateText="PDF"
                                    Height="30px" Width="25px" CommandName="Update" />
                                <asp:ImageButton ID="lnk_Delete" runat="server" AlternateText="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this Occurrence?');"
                                    ImageUrl="../images/delete.png" Height="35px" Width="35px" />
                             
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                </asp:GridView>
            </div>
        </asp:Panel>
    </div>    
</asp:Content>