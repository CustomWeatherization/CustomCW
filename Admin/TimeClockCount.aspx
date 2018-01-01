<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master"
    AutoEventWireup="true" CodeFile="TimeClockCount.aspx.cs" Inherits="Admin_TimeClockCount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
 
        .BtnPrintHistory{ margin:5px 0px !important;}
        .textbox88
        {
            border: 1px solid #ccc;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #717171;
            border-radius: 5px;
            padding: 8px;
            width: 30px;
            margin: 6px 0 5px 0;
        }
        .textbox90
        {
            border: 1px solid #ccc;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #717171;
            border-radius: 5px;
            padding: 8px;
            width: 65px;
            margin: 6px 0 5px 0;
        }
        .Background
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .paidBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
        }
        .paidBtnDis
        {
            background: #A1DCF2;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
            margin-top:15px;
        }
        .Popup1
        {
            padding: 20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            padding-left: 10px;
            width: 1150px;
            height: 500px;
            border-radius: 10px;
        }
        .Popup2
        {
            padding: 20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            padding-left: 10px;
            width: 380px;
            height: 450px;
            border-radius: 10px;
        }
        .timepicker span table tbody tr td input 
        { 
            font-size:larger !important;
            height:29px !important;
            width:45px !important;
        }
        .timepicker span table tbody tr td img
        {    margin-bottom: 5px;
             margin-top:4px
        	
        	}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:GridView ID="grdEmployeTimeTracking" runat="server">
    </asp:GridView>--%>
    <br />
    <br />
    <%--  <asp:UpdatePanel ID="UpPnlEmployee" runat="server">
        <ContentTemplate>--%>
    <table align="center">
        <tr>
            <td>
                <strong>Employee:-</strong>&nbsp;<asp:DropDownList ID="DDL_Employee" runat="server"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: black; border-radius: 5px; padding: 8px; margin: 0; width: 200px; height: 35px"
                    MaxLength="40" AutoPostBack="true" OnSelectedIndexChanged="DDL_Employee_SelectedIndexChanged">
                </asp:DropDownList>
                
            </td>
            <td>
                <asp:TextBox ID="txtFromDate" runat="server" Width="180px" CssClass="textbox88" placeholder="From Date"></asp:TextBox><ajaxToolkit:CalendarExtender
                    ID="CalendarExtender1" runat="server" TargetControlID="txtFromDate">
                </ajaxToolkit:CalendarExtender>
            </td>
            
            <td>
                <asp:TextBox ID="txtToDate" Width="180px" runat="server" CssClass="textbox88" placeholder="To Date"></asp:TextBox><ajaxToolkit:CalendarExtender
                    ID="CalendarExtender2" runat="server" TargetControlID="txtToDate">
                </ajaxToolkit:CalendarExtender>
            </td>
            <td>
                <asp:Button ID="btn_search" Text="Search" runat="server" OnClick="btn_Search_Click"
                    CssClass="BtnPrintHistory" />
            </td>
        </tr>
    </table>   
    <asp:Button ID="btnNotPay" runat="server" Text="Active" CssClass="paidBtn" OnClick="btnActive_Click" />
    <asp:Button ID="btnPay" runat="server" Text="DeActivated" CssClass="paidBtnDis" OnClick="btnDeactive_Click" />
   <asp:Button ID="btn_Add" Text="Add Hours" runat="server" OnClick="btn_Add_Click" style="text-align: right;float:right"
                    CssClass="BtnPrintHistory" />
                                         
    <br />
    <div class="rounded_corners" style="width: 100%; overflow: auto; max-height: 600px;">
        <asp:GridView ID="grdEmployeTimeTracking" runat="server" Width="100%" DataKeyNames="Emp_Id"
            AutoGenerateColumns="false" OnRowUpdating="grdEmployeTimeTracking_RowUpdating"
            OnRowDeleting="grdEmployeTimeTracking_RowDeleting" PageSize="10" AllowPaging="true"
            OnPageIndexChanging="grdEmployeTimeTracking_PageIndexChanging" HeaderStyle-BackColor="#3AC0F2"
            HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
            RowStyle-ForeColor="#3A3A3A" OnRowDataBound="gvUserInfo_RowDataBound">
            <%-- <RowStyle BackColor="white" ForeColor="#3A3A3A"   ></RowStyle> --%><%--AlternatingRowStyle-BackColor="White"--%>
            <Columns>
                <asp:TemplateField HeaderText="Employee Name">
                    <ItemStyle Height="28px" />
                    <HeaderStyle Height="28px" />
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%-- <asp:BoundField DataField="Emp_Id" HeaderText="Emp_Id" HeaderStyle-HorizontalAlign="Left" />--%>
                <asp:TemplateField HeaderText="Working Duration">
                    <ItemTemplate>
                        <%--<asp:Label ID="lnlBlank" runat="server" Text="-" Visible="false"></asp:Label>  OnRowDataBound="grdEmployeTimeTracking_RowDataBound"--%>
                        <asp:Label ID="lnlTm" runat="server"></asp:Label><%--Text='<%# getdate(Eval("TotalWorkingDuration"))%>'--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                      
                        <asp:LinkButton ID="lnk_Edit" runat="server" Text="View Report" Visible="false" CommandName="Update"></asp:LinkButton>
                        <a href="JavaScript:divexpandcollapse('div<%# Eval("Emp_Id") %>');">
                            <img id="imgdiv<%# Eval("Emp_Id") %>" width="20px" border="0" src="../images/Plus.png"
                                title="View Report" />
                        </a>
                        <tr>
                            <td colspan="100%">
                                <div id="div<%# Eval("Emp_Id") %>" style="display: none; left: 15px; max-height: 600px;
                                    overflow: auto">
                                    <div style="width: 100%; height: 45px;">
                                        <img src="images/calendar_time1.png" alt="Smiley face" height="30" width="40" style="float: left;
                                            margin-right: 10px;">
                                        <p style="text-align: left">
                                            <b>My Hours For</b>
                                            <br />
                                            <asp:Label ID="lblHoursFromTo" runat="server"></asp:Label></p>
                                         
                                    </div>
                                    <asp:GridView ID="gvChildGrid" runat="server" AutoGenerateColumns="false" BorderStyle="Double"
                                        DataKeyNames="Emp_Id, ADate" EmptyDataText="No Record Found" GridLines="None"
                                        Width="100%" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                                        RowStyle-ForeColor="#3A3A3A" OnRowDataBound="gvChildGrid_RowDataBound" RowStyle-Height="30px"
                                        ShowFooter="true">
                                        <%--<HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                        <RowStyle BackColor="#E1E1E1" />--%>
                                        <%--  <AlternatingRowStyle BackColor="White" />--%>
                                        <HeaderStyle BackColor="#3570a0" Font-Bold="true" ForeColor="White" Height="30px" />
                                        <RowStyle BackColor="white" ForeColor="#3A3A3A"></RowStyle>
                                        <Columns>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemStyle Width="10%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%#Convert.ToDateTime(Eval("ADate")).ToShortDateString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="In">
                                                <ItemStyle Width="12%" />
                                                <ItemTemplate>
                                                    <%--  <asp:Label ID="lblSwipeIn1" runat="server" Text='<%#Eval("SwipeIn1")%>' ></asp:Label>--%>
                                                    <asp:Label ID="lblSwipeIn1" runat="server" Text='<%#Eval("SwipeIn1")%>'></asp:Label>                                                   
                                                 
                                                    <asp:Image  ID="commentin1" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("InComment1")) ? ((Eval("InComment1")!="" && Eval("InComment1")!="&nbsp" )?"images/info-xxl.png":"") : "" %>' title='<%#Eval("InComment1")%>' />
                                                 
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Out">
                                                <ItemStyle Width="12%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSwipeOut1" runat="server" Text='<%#Eval("SwipeOut1")%>'></asp:Label>
                                             
                                                    <asp:Image ID="commentout1" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("OutComment1")) ? ( (Eval("OutComment1")!="" && Eval("OutComment1")!="&nbsp")?"images/info-xxl.png":"") : "" %>' title='<%#Eval("OutComment1")%>'/>
                                                   
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="In">
                                                <ItemStyle Width="12%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSwipeIn2" runat="server" Text='<%#Eval("SwipeIn2")%>'></asp:Label>
                                                      <asp:Image ID="commentin2" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("InComment2")) ? ((Eval("InComment2")!="" && Eval("InComment2")!="&nbsp")?"images/info-xxl.png":"") : "" %>' title='<%#Eval("InComment2")%>'/>
                                                     <%--<asp:Image ID="commentin2" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("InComment2")) ?  Eval("InComment2") : "images/architetto_FEVICON.png" %>' />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Out">
                                                <ItemStyle Width="12%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSwipeOut2" runat="server" Text='<%#Eval("SwipeOut2")%>'></asp:Label>
                                                       <asp:Image ID="commentout2" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("OutComment2")) ? ( (Eval("OutComment2")!="" && Eval("OutComment2")!="&nbsp")?"images/info-xxl.png":"") : "" %>' title='<%#Eval("OutComment2")%>' />
                                                    <%--<asp:Image ID="commentin2" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("OutComment2")) ?  Eval("OutComment2") : "images/architetto_FEVICON.png" %>' />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                          
                                            <asp:TemplateField HeaderText="In">
                                                <ItemStyle Width="12%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSwipeIn3" runat="server" Text='<%#Eval("SwipeIn3")%>'></asp:Label>
                                                    <asp:Image ID="commentin3" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("InComment3")) ? ( (Eval("InComment3")!="" && Eval("InComment3")!="&nbsp")?"images/info-xxl.png":"") : "" %>' title='<%#Eval("InComment3")%>'/>
                                                      <%--<asp:Image ID="commentin3" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("InComment3")) ?  Eval("InComment3") : "images/architetto_FEVICON.png" %>' />--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div style="height: 54px; width: 122px; background-color: #cccccc; padding: 10px 5px;border-radius: 5px">
                                                    
                                                        <b>Total</b>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="lbl_GrandTotal" runat="server"></asp:Label>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Out">
                                                <ItemStyle Width="12%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSwipeOut3" runat="server" Text='<%#Eval("SwipeOut3")%>'></asp:Label>
                                                   <asp:Image ID="commentout3" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("OutComment3")) ? ( (Eval("OutComment3")!="" && Eval("OutComment3")!="&nbsp")?"images/info-xxl.png":"") : "" %>'  title='<%#Eval("OutComment3")%>'/>
                                                      <%--<asp:Image ID="commentout3" runat="server" ImageUrl='<%#!DBNull.Value.Equals(Eval("OutComment3")) ?  Eval("OutComment3") : "images/architetto_FEVICON.png" %>' />--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div style="height: 54px; width: 122px; background-color: #4cc063; padding: 10px 5px;border-radius: 5px">
                                                        <b>Regular</b>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="lblRegularHours" runat="server"></asp:Label>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                       
                                            <asp:TemplateField HeaderText="Total Hours">
                                                <ItemStyle Width="15%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalHoursTime" runat="server"></asp:Label>
                                                   
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    
                                                    <div style="height: 54px; width: 122px; background-color: #f6b153; padding: 10px 5px;border-radius: 5px">
                                                        <b>Overtime</b>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="lblOverTimeHours" runat="server"></asp:Label>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEditDateTime" runat="server" OnClick="lnkEditDateTime_Click"
                                                        Text="Edit"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:TemplateField>
                <%-- <asp:TemplateField>
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>--%>
            </Columns>
        </asp:GridView>
    </div>
    <asp:Button ID="btnShow" runat="server" Style="display: none" OnClick="btnShowPopup_Click1" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="pnlEditDateTime"
        TargetControlID="btnShow" BehaviorID="mpeEdit" BackgroundCssClass="Background"
        X="512" Y="15">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlEditDateTime" runat="server" CssClass="Popup1" align="center" Style="display: none">
        <div style="width: 97%">
            <div style="text-align: center; width: 100% !important;" class="divalign">
                <h1 class="assign" style="width: 100% !important;">
                    <b>
                        <asp:Label runat="server" ID="Label1" Text="Update Details"></asp:Label></b>
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/Cross3.png" Height="35px"
                        Width="35px" Style="float: right; margin-right: 20px;" OnClick="btn_Edit_Click" /></h1>
                <%--OnClick="btn_cancelPayment_Click"--%>
            </div>
            <table align="center">
                <tr>
                    <td>
                        <strong>Employee:-</strong>&nbsp;<asp:DropDownList ID="ddlEmployeeEdit" runat="server"
                            Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                            color: black; border-radius: 5px; padding: 8px; margin: 0; width: 200px; height: 35px"
                            MaxLength="40">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server" Width="180px" CssClass="textbox88" placeholder="Select Date"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtDate">
                        </ajaxToolkit:CalendarExtender>
                    </td>
                   
                </tr>
            </table>
            <br />
            <div class="rounded_corners" style="width: 100%; overflow: auto; max-height: 450px;"
                id="div_grid" runat="server">
                <asp:GridView ID="grdDetails" runat="server" Width="100%"    DataKeyNames="Emp_Id, ADate" class="leaves-tbl"
                    AutoGenerateColumns="false" PageSize="10" AllowPaging="true" HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" EmptyDataText="No Request Available">
                    <HeaderStyle BackColor="#3570a0" Font-Bold="true" ForeColor="White" Height="50px" />
                    <RowStyle BackColor="#A1DCF2" ForeColor="#3A3A3A"></RowStyle>
                    <Columns>
                        <asp:TemplateField HeaderText="Sign In">
                        <ItemStyle Width="20%" />
                            <ItemTemplate>
                           <%--<asp:HiddenField ID="hdnswipetime" value='<%#Eval("SwipeIn")%>' runat="server" />--%>
                             <%--   <asp:TextBox ID="txtSwipeIn" Width="80px" runat="server" Text='<%#Eval("SwipeIn")%>' CssClass="textbox88"></asp:TextBox> <br />--%>
                               <asp:DropDownList ID="ddlHoursFromTime" CssClass="textbox90" ValidationGroup="R"
                                            runat="server">
                                            <asp:ListItem Text="00" Value="00" />
                                            <asp:ListItem Text="01" Value="01" />
                                            <asp:ListItem Text="02" Value="02" />
                                            <asp:ListItem Text="03" Value="03" />
                                            <asp:ListItem Text="04" Value="04" />
                                            <asp:ListItem Text="05" Value="05" />
                                            <asp:ListItem Text="06" Value="06" />
                                            <asp:ListItem Text="07" Value="07" />
                                            <asp:ListItem Text="08" Value="08" />
                                            <asp:ListItem Text="09" Value="09" />
                                            <asp:ListItem Text="10" Value="10" />
                                            <asp:ListItem Text="11" Value="11" />
                                            <asp:ListItem Text="12" Value="12" />
                                           
                                        </asp:DropDownList>
                                          <asp:DropDownList ID="ddlMinuteFromTime" AppendDataBoundItems="true" CssClass="textbox90" runat="server">
                                            <asp:ListItem Text="00" Value="00" />
                                           <asp:ListItem Text="01" Value="01" />
                                           <asp:ListItem Text="02" Value="02" />
                                           <asp:ListItem Text="03" Value="03" />
                                           <asp:ListItem Text="04" Value="04" />
                                           <asp:ListItem Text="05" Value="05" />
                                           <asp:ListItem Text="06" Value="06" />
                                           <asp:ListItem Text="07" Value="07" />
                                           <asp:ListItem Text="08" Value="08" />
                                           <asp:ListItem Text="09" Value="09" />
                                           <asp:ListItem Text="10" Value="10" />
                                           <asp:ListItem Text="11" Value="11" />
                                           <asp:ListItem Text="12" Value="12" />
                                           <asp:ListItem Text="13" Value="13" />
                                           <asp:ListItem Text="14" Value="14" />
                                           <asp:ListItem Text="15" Value="15" />
                                           <asp:ListItem Text="16" Value="16" />
                                           <asp:ListItem Text="17" Value="17" />
                                           <asp:ListItem Text="18" Value="18" />
                                           <asp:ListItem Text="19" Value="19" />
                                           <asp:ListItem Text="20" Value="20" />
                                           <asp:ListItem Text="21" Value="21" />
                                           <asp:ListItem Text="22" Value="22" />
                                           <asp:ListItem Text="23" Value="23" />
                                           <asp:ListItem Text="24" Value="24"/>
                                           <asp:ListItem Text="25" Value="25"/>
                                           <asp:ListItem Text="26" Value="26"/>
                                           <asp:ListItem Text="27" Value="27"/>
                                           <asp:ListItem Text="28" Value="28"/>
                                           <asp:ListItem Text="29" Value="29"/>
                                           <asp:ListItem Text="30" Value="30"/>
                                           <asp:ListItem Text="31" Value="31"/>
                                           <asp:ListItem Text="32" Value="32"/>
                                           <asp:ListItem Text="33" Value="33"/>
                                           <asp:ListItem Text="34" Value="34" />
                                           <asp:ListItem Text="35" Value="35" />
                                           <asp:ListItem Text="36" Value="36" />
                                           <asp:ListItem Text="37" Value="37" />
                                           <asp:ListItem Text="38" Value="38" />
                                           <asp:ListItem Text="39" Value="39" />
                                           <asp:ListItem Text="40" Value="40" />
                                           <asp:ListItem Text="41" Value="41" />
                                           <asp:ListItem Text="42" Value="42" />
                                           <asp:ListItem Text="43" Value="43" />
                                           <asp:ListItem Text="44" Value="44" />
                                           <asp:ListItem Text="45" Value="45" />
                                           <asp:ListItem Text="46" Value="46" />
                                           <asp:ListItem Text="47" Value="47" />
                                           <asp:ListItem Text="48" Value="48"/>
                                           <asp:ListItem Text="49" Value="49"/>
                                           <asp:ListItem Text="50" Value="50"/>
                                           <asp:ListItem Text="51" Value="51" />
                                           <asp:ListItem Text="52" Value="52" />
                                           <asp:ListItem Text="53" Value="53" />
                                           <asp:ListItem Text="54" Value="54" />
                                           <asp:ListItem Text="55" Value="55" />
                                           <asp:ListItem Text="56" Value="56" />
                                           <asp:ListItem Text="57" Value="57" />
                                           <asp:ListItem Text="58" Value="58" />
                                           <asp:ListItem Text="59" Value="59" />
                                           <asp:ListItem Text="60" Value="60" />
                                           
                                        </asp:DropDownList>
                                          <asp:DropDownList ID="ddlAMPMFromTime" AppendDataBoundItems="true" CssClass="textbox90"
                                           runat="server">
                                            <asp:ListItem Text="AM" Value="AM" />
                                            <asp:ListItem Text="PM" Value="PM" />
                                           
                                        </asp:DropDownList>
                               <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationGroup="G" ControlToValidate="txtSwipeIn" Display="Dynamic" ErrorMessage="Enter time in a valid format.(Ex. 12:30 AM)" ValidationExpression="^(1[0-2]|0[1-9]):[0-5][0-9]\040(AM|am|PM|pm)$"></asp:RegularExpressionValidator> --%>
                              <%--  <asp:RegularExpressionValidator ID="TimeValidator" runat="server" ControlToValidate="txtSwipeIn" Display="Dynamic" ErrorMessage="Invalid Time.  Enter time in a valid format.  Example: 12:30 or 5:00" ValidationExpression="^(1[0-2]|[1-9]):[0-5][0-9]$" EnableClientScript="False"></asp:RegularExpressionValidator>--%>
                                <%--<asp:Label ID="lbl_SwipeIn" runat="server" ></asp:Label>--%>
                                <%--<asp:DropDownList ID="ddlAmPmIn" runat="server">
                                    <asp:ListItem Selected="True">AM</asp:ListItem>
                                    <asp:ListItem Selected="False">PM</asp:ListItem>
                                </asp:DropDownList>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="In Comment">
                        <ItemStyle Width="35%" />
                            <ItemTemplate>
                                <asp:TextBox ID="txtInComment" runat="server" TextMode="MultiLine" Width="60%" Height="40px" Text='<%#Eval("InComment")%>' CssClass="textbox88"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sign Out">
                        <ItemStyle Width="20%" />
                            <ItemTemplate>
                                <%--<asp:TextBox ID="txtSwipeOut" Width="80px" runat="server" Text='<%#Eval("SwipeOut")%>' CssClass="textbox88"></asp:TextBox>
                                  <br />--%>
                                   <asp:DropDownList ID="ddlHoursTomTime" CssClass="textbox90"
                                            runat="server">
                                            <asp:ListItem Text="00" Value="00" />
                                            <asp:ListItem Text="01" Value="01" />
                                            <asp:ListItem Text="02" Value="02" />
                                            <asp:ListItem Text="03" Value="03" />
                                            <asp:ListItem Text="04" Value="04" />
                                            <asp:ListItem Text="05" Value="05" />
                                            <asp:ListItem Text="06" Value="06" />
                                            <asp:ListItem Text="07" Value="07" />
                                            <asp:ListItem Text="08" Value="08" />
                                            <asp:ListItem Text="09" Value="09" />
                                            <asp:ListItem Text="10" Value="10" />
                                            <asp:ListItem Text="11" Value="11" />
                                            <asp:ListItem Text="12" Value="12" />
                                           
                                        </asp:DropDownList>
                                        
                                          <asp:DropDownList ID="ddlMinuteToTime" CssClass="textbox90" runat="server">
                                            <asp:ListItem Text="00" Value="00" />
                                           <asp:ListItem Text="01" Value="01" />
                                           <asp:ListItem Text="02" Value="02" />
                                           <asp:ListItem Text="03" Value="03" />
                                           <asp:ListItem Text="04" Value="04" />
                                           <asp:ListItem Text="05" Value="05" />
                                           <asp:ListItem Text="06" Value="06" />
                                           <asp:ListItem Text="07" Value="07" />
                                           <asp:ListItem Text="08" Value="08" />
                                           <asp:ListItem Text="09" Value="09" />
                                           <asp:ListItem Text="10" Value="10" />
                                           <asp:ListItem Text="11" Value="11" />
                                           <asp:ListItem Text="12" Value="12" />
                                           <asp:ListItem Text="13" Value="13" />
                                           <asp:ListItem Text="14" Value="14" />
                                           <asp:ListItem Text="15" Value="15" />
                                           <asp:ListItem Text="16" Value="16" />
                                           <asp:ListItem Text="17" Value="17" />
                                           <asp:ListItem Text="18" Value="18" />
                                           <asp:ListItem Text="19" Value="19" />
                                           <asp:ListItem Text="20" Value="20" />
                                           <asp:ListItem Text="21" Value="21" />
                                           <asp:ListItem Text="22" Value="22" />
                                           <asp:ListItem Text="23" Value="23" />
                                           <asp:ListItem Text="24" Value="24"/>
                                           <asp:ListItem Text="25" Value="25"/>
                                           <asp:ListItem Text="26" Value="26"/>
                                           <asp:ListItem Text="27" Value="27"/>
                                           <asp:ListItem Text="28" Value="28"/>
                                           <asp:ListItem Text="29" Value="29"/>
                                           <asp:ListItem Text="30" Value="30"/>
                                           <asp:ListItem Text="31" Value="31"/>
                                           <asp:ListItem Text="32" Value="32"/>
                                           <asp:ListItem Text="33" Value="33"/>
                                           <asp:ListItem Text="34" Value="34" />
                                           <asp:ListItem Text="35" Value="35" />
                                           <asp:ListItem Text="36" Value="36" />
                                           <asp:ListItem Text="37" Value="37" />
                                           <asp:ListItem Text="38" Value="38" />
                                           <asp:ListItem Text="39" Value="39" />
                                           <asp:ListItem Text="40" Value="40" />
                                           <asp:ListItem Text="41" Value="41" />
                                           <asp:ListItem Text="42" Value="42" />
                                           <asp:ListItem Text="43" Value="43" />
                                           <asp:ListItem Text="44" Value="44" />
                                           <asp:ListItem Text="45" Value="45" />
                                           <asp:ListItem Text="46" Value="46" />
                                           <asp:ListItem Text="47" Value="47" />
                                           <asp:ListItem Text="48" Value="48"/>
                                           <asp:ListItem Text="49" Value="49"/>
                                           <asp:ListItem Text="50" Value="50"/>
                                           <asp:ListItem Text="51" Value="51" />
                                           <asp:ListItem Text="52" Value="52" />
                                           <asp:ListItem Text="53" Value="53" />
                                           <asp:ListItem Text="54" Value="54" />
                                           <asp:ListItem Text="55" Value="55" />
                                           <asp:ListItem Text="56" Value="56" />
                                           <asp:ListItem Text="57" Value="57" />
                                           <asp:ListItem Text="58" Value="58" />
                                           <asp:ListItem Text="59" Value="59" />
                                           <asp:ListItem Text="60" Value="60" />
                                           
                                        </asp:DropDownList>
                                          <asp:DropDownList ID="ddlAMPMToTime" CssClass="textbox90"
                                           runat="server">
                                            <asp:ListItem Text="AM" Value="AM" />
                                            <asp:ListItem Text="PM" Value="PM" />
                                           
                                        </asp:DropDownList>
                                  <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="G" ControlToValidate="txtSwipeOut" Display="Dynamic" ErrorMessage="Enter time in a valid format.(Ex. 12:30 AM)" ValidationExpression="^(1[0-2]|0[1-9]):[0-5][0-9]\040(AM|am|PM|pm)$"></asp:RegularExpressionValidator> --%>
                           
                                 <asp:HiddenField ID="id" runat="server" Value='<%#Eval("Id")%>'/>
                              <%--  <asp:DropDownList ID="ddlAmPmOut" runat="server">
                                    <asp:ListItem Selected="True">AM</asp:ListItem>
                                    <asp:ListItem Selected="False">PM</asp:ListItem>
                                </asp:DropDownList>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Out Comment">
                        <ItemStyle Width="35%" />
                            <ItemTemplate>
                                <asp:TextBox ID="txtOutComment" runat="server" TextMode="MultiLine" Width="60%" Height="40px" Text='<%#Eval("OutComment")%>' CssClass="textbox88"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                </asp:GridView>
                <asp:Button ID="btnUpdate" Text="Update" runat="server" OnClick="btn_update_Click" ValidationGroup="G"
                    CssClass="BtnPrintHistory" />
            </div>
        </div>
    </asp:Panel>
     <asp:Button ID="btnAdd" runat="server" Style="display: none" OnClick="btnShowPopup_Click1" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlAddTime"
        TargetControlID="btnAdd" BehaviorID="mpeAdd" BackgroundCssClass="Background"
        X="712" Y="35">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlAddTime" runat="server" CssClass="Popup2" align="center" Style="display: none">
        <div style="width: 97%">
            <div style="text-align: center; width: 100% !important;" class="divalign">
                <h1 class="assign" style="width: 100% !important;">
                    <b>
                        <asp:Label runat="server" ID="Label2" Text="Add Details"></asp:Label></b>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/Cross3.png" Height="35px"
                        Width="35px" Style="float: right; margin-right: 10px;" OnClick="btn_Edit_Click"  /></h1>
                <%--OnClick="btn_cancelPayment_Click"--%>
            </div>
            <table align="center">
                <tr>
                    <td>
                        <strong>Employee:-</strong>&nbsp;
                        </td>  <td>
                        <asp:DropDownList ID="ddlEmployeeAdd" runat="server"
                            Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                            color: black; border-radius: 5px; padding: 8px; margin: 0; width: 200px; height: 35px"
                            MaxLength="40" ValidationGroup="R">
                        </asp:DropDownList><br />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="R"
                                    ControlToValidate="ddlEmployeeAdd" ErrorMessage="Select Employee Name" InitialValue="Select Employee"
                                    Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                    </tr>
                    <tr><td>
                    <strong>Date:-</strong>&nbsp;  </td>  <td>
                        <asp:TextBox ID="txtAddDate" runat="server" Width="180px" CssClass="textbox88" placeholder="Select Date"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="R" ControlToValidate="txtAddDate" ErrorMessage="Enter Date" 
                                   ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator> 
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtAddDate">
                        </ajaxToolkit:CalendarExtender>
                    </td>
                    <td></td>
                    </tr>
                    
                
                 <tr>
                    <td>
                    <strong>From Time:-</strong>&nbsp;</td>  <td>
                    
                     <asp:DropDownList ID="ddlHoursFromTime" CssClass="textbox90" ValidationGroup="R"
                                            runat="server">
                                            <asp:ListItem Text="00" Value="00" />
                                            <asp:ListItem Text="01" Value="01" />
                                            <asp:ListItem Text="02" Value="02" />
                                            <asp:ListItem Text="03" Value="03" />
                                            <asp:ListItem Text="04" Value="04" />
                                            <asp:ListItem Text="05" Value="05" />
                                            <asp:ListItem Text="06" Value="06" />
                                            <asp:ListItem Text="07" Value="07" />
                                            <asp:ListItem Text="08" Value="08" />
                                            <asp:ListItem Text="09" Value="09" />
                                            <asp:ListItem Text="10" Value="10" />
                                            <asp:ListItem Text="11" Value="11" />
                                            <asp:ListItem Text="12" Value="12" />
                                           
                                        </asp:DropDownList>
                                          <asp:DropDownList ID="ddlMinuteFromTime" AppendDataBoundItems="true" CssClass="textbox90" runat="server">
                                            <asp:ListItem Text="00" Value="00" />
                                           <asp:ListItem Text="01" Value="01" />
                                           <asp:ListItem Text="02" Value="02" />
                                           <asp:ListItem Text="03" Value="03" />
                                           <asp:ListItem Text="04" Value="04" />
                                           <asp:ListItem Text="05" Value="05" />
                                           <asp:ListItem Text="06" Value="06" />
                                           <asp:ListItem Text="07" Value="07" />
                                           <asp:ListItem Text="08" Value="08" />
                                           <asp:ListItem Text="09" Value="09" />
                                           <asp:ListItem Text="10" Value="10" />
                                           <asp:ListItem Text="11" Value="11" />
                                           <asp:ListItem Text="12" Value="12" />
                                           <asp:ListItem Text="13" Value="13" />
                                           <asp:ListItem Text="14" Value="14" />
                                           <asp:ListItem Text="15" Value="15" />
                                           <asp:ListItem Text="16" Value="16" />
                                           <asp:ListItem Text="17" Value="17" />
                                           <asp:ListItem Text="18" Value="18" />
                                           <asp:ListItem Text="19" Value="19" />
                                           <asp:ListItem Text="20" Value="20" />
                                           <asp:ListItem Text="21" Value="21" />
                                           <asp:ListItem Text="22" Value="22" />
                                           <asp:ListItem Text="23" Value="23" />
                                           <asp:ListItem Text="24" Value="24"/>
                                           <asp:ListItem Text="25" Value="25"/>
                                           <asp:ListItem Text="26" Value="26"/>
                                           <asp:ListItem Text="27" Value="27"/>
                                           <asp:ListItem Text="28" Value="28"/>
                                           <asp:ListItem Text="29" Value="29"/>
                                           <asp:ListItem Text="30" Value="30"/>
                                           <asp:ListItem Text="31" Value="31"/>
                                           <asp:ListItem Text="32" Value="32"/>
                                           <asp:ListItem Text="33" Value="33"/>
                                           <asp:ListItem Text="34" Value="34" />
                                           <asp:ListItem Text="35" Value="35" />
                                           <asp:ListItem Text="36" Value="36" />
                                           <asp:ListItem Text="37" Value="37" />
                                           <asp:ListItem Text="38" Value="38" />
                                           <asp:ListItem Text="39" Value="39" />
                                           <asp:ListItem Text="40" Value="40" />
                                           <asp:ListItem Text="41" Value="41" />
                                           <asp:ListItem Text="42" Value="42" />
                                           <asp:ListItem Text="43" Value="43" />
                                           <asp:ListItem Text="44" Value="44" />
                                           <asp:ListItem Text="45" Value="45" />
                                           <asp:ListItem Text="46" Value="46" />
                                           <asp:ListItem Text="47" Value="47" />
                                           <asp:ListItem Text="48" Value="48"/>
                                           <asp:ListItem Text="49" Value="49"/>
                                           <asp:ListItem Text="50" Value="50"/>
                                           <asp:ListItem Text="51" Value="51" />
                                           <asp:ListItem Text="52" Value="52" />
                                           <asp:ListItem Text="53" Value="53" />
                                           <asp:ListItem Text="54" Value="54" />
                                           <asp:ListItem Text="55" Value="55" />
                                           <asp:ListItem Text="56" Value="56" />
                                           <asp:ListItem Text="57" Value="57" />
                                           <asp:ListItem Text="58" Value="58" />
                                           <asp:ListItem Text="59" Value="59" />
                                           <asp:ListItem Text="60" Value="60" />
                                           
                                        </asp:DropDownList>
                                          <asp:DropDownList ID="ddlAMPMFromTime" AppendDataBoundItems="true" CssClass="textbox90"
                                           runat="server">
                                            <asp:ListItem Text="AM" Value="AM" />
                                            <asp:ListItem Text="PM" Value="PM" />
                                           
                                        </asp:DropDownList><br />
                                          <asp:RequiredFieldValidator ID="requiredfieldvalidator4" runat="server" ValidationGroup="R"
                                    ControlToValidate="ddlHoursFromTime" ErrorMessage="Select From time" Display="dynamic" InitialValue="00" ForeColor="Red"></asp:RequiredFieldValidator>
                        <%--<asp:TextBox ID="txtFromTime" runat="server" Width="180px" CssClass="textbox88" placeholder="From Time(12:00 AM)"></asp:TextBox> <br />--%>
                     <%--   <div class="timepicker">--%>
                        
                       <%-- <cc1:TimeSelector ID="txtFromTime" runat="server" DisplaySeconds="false" MinuteIncrement="1" >
                           </cc1:TimeSelector></div>--%>
                         <%--<asp:RequiredFieldValidator ID="rfv_DDL_AllDates" runat="server" ValidationGroup="R"
                                    ControlToValidate="txtFromTime" ErrorMessage="Enter from time" 
                                    Display="Dynamic"></asp:RequiredFieldValidator> --%>
                           <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="R" ControlToValidate="txtFromTime" Display="Dynamic" ErrorMessage="Enter time in a valid format.(Ex. 12:30 AM)" ValidationExpression="^(1[0-2]|0[1-9]):[0-5][0-9]\040(AM|am|PM|pm)$"  ></asp:RegularExpressionValidator>         --%>
                                    
                                    </td>     
                                    <td></td>              
                      </tr>
                   <tr> <td>
                   <strong>To Time:-</strong>&nbsp;</td>  <td>
                     <asp:DropDownList ID="ddlHoursTomTime" CssClass="textbox90"
                                            runat="server">
                                            <asp:ListItem Text="00" Value="00" />
                                            <asp:ListItem Text="01" Value="01" />
                                            <asp:ListItem Text="02" Value="02" />
                                            <asp:ListItem Text="03" Value="03" />
                                            <asp:ListItem Text="04" Value="04" />
                                            <asp:ListItem Text="05" Value="05" />
                                            <asp:ListItem Text="06" Value="06" />
                                            <asp:ListItem Text="07" Value="07" />
                                            <asp:ListItem Text="08" Value="08" />
                                            <asp:ListItem Text="09" Value="09" />
                                            <asp:ListItem Text="10" Value="10" />
                                            <asp:ListItem Text="11" Value="11" />
                                            <asp:ListItem Text="12" Value="12" />
                                           
                                        </asp:DropDownList>
                                        
                                          <asp:DropDownList ID="ddlMinuteToTime" CssClass="textbox90" runat="server">
                                            <asp:ListItem Text="00" Value="00" />
                                           <asp:ListItem Text="01" Value="01" />
                                           <asp:ListItem Text="02" Value="02" />
                                           <asp:ListItem Text="03" Value="03" />
                                           <asp:ListItem Text="04" Value="04" />
                                           <asp:ListItem Text="05" Value="05" />
                                           <asp:ListItem Text="06" Value="06" />
                                           <asp:ListItem Text="07" Value="07" />
                                           <asp:ListItem Text="08" Value="08" />
                                           <asp:ListItem Text="09" Value="09" />
                                           <asp:ListItem Text="10" Value="10" />
                                           <asp:ListItem Text="11" Value="11" />
                                           <asp:ListItem Text="12" Value="12" />
                                           <asp:ListItem Text="13" Value="13" />
                                           <asp:ListItem Text="14" Value="14" />
                                           <asp:ListItem Text="15" Value="15" />
                                           <asp:ListItem Text="16" Value="16" />
                                           <asp:ListItem Text="17" Value="17" />
                                           <asp:ListItem Text="18" Value="18" />
                                           <asp:ListItem Text="19" Value="19" />
                                           <asp:ListItem Text="20" Value="20" />
                                           <asp:ListItem Text="21" Value="21" />
                                           <asp:ListItem Text="22" Value="22" />
                                           <asp:ListItem Text="23" Value="23" />
                                           <asp:ListItem Text="24" Value="24"/>
                                           <asp:ListItem Text="25" Value="25"/>
                                           <asp:ListItem Text="26" Value="26"/>
                                           <asp:ListItem Text="27" Value="27"/>
                                           <asp:ListItem Text="28" Value="28"/>
                                           <asp:ListItem Text="29" Value="29"/>
                                           <asp:ListItem Text="30" Value="30"/>
                                           <asp:ListItem Text="31" Value="31"/>
                                           <asp:ListItem Text="32" Value="32"/>
                                           <asp:ListItem Text="33" Value="33"/>
                                           <asp:ListItem Text="34" Value="34" />
                                           <asp:ListItem Text="35" Value="35" />
                                           <asp:ListItem Text="36" Value="36" />
                                           <asp:ListItem Text="37" Value="37" />
                                           <asp:ListItem Text="38" Value="38" />
                                           <asp:ListItem Text="39" Value="39" />
                                           <asp:ListItem Text="40" Value="40" />
                                           <asp:ListItem Text="41" Value="41" />
                                           <asp:ListItem Text="42" Value="42" />
                                           <asp:ListItem Text="43" Value="43" />
                                           <asp:ListItem Text="44" Value="44" />
                                           <asp:ListItem Text="45" Value="45" />
                                           <asp:ListItem Text="46" Value="46" />
                                           <asp:ListItem Text="47" Value="47" />
                                           <asp:ListItem Text="48" Value="48"/>
                                           <asp:ListItem Text="49" Value="49"/>
                                           <asp:ListItem Text="50" Value="50"/>
                                           <asp:ListItem Text="51" Value="51" />
                                           <asp:ListItem Text="52" Value="52" />
                                           <asp:ListItem Text="53" Value="53" />
                                           <asp:ListItem Text="54" Value="54" />
                                           <asp:ListItem Text="55" Value="55" />
                                           <asp:ListItem Text="56" Value="56" />
                                           <asp:ListItem Text="57" Value="57" />
                                           <asp:ListItem Text="58" Value="58" />
                                           <asp:ListItem Text="59" Value="59" />
                                           <asp:ListItem Text="60" Value="60" />
                                           
                                        </asp:DropDownList>
                                          <asp:DropDownList ID="ddlAMPMToTime" CssClass="textbox90"
                                           runat="server">
                                            <asp:ListItem Text="AM" Value="AM" />
                                            <asp:ListItem Text="PM" Value="PM" />
                                           
                                        </asp:DropDownList>
                                        
                  <%-- <div class="timepicker">
                   
                        <cc1:TimeSelector ID="txtToTime" runat="server" DisplaySeconds="false" MinuteIncrement="1"  >
                           </cc1:TimeSelector></div>--%>
                        <%--<asp:TextBox ID="txtToTime" runat="server" Width="180px" CssClass="textbox88" placeholder="To Time((12:00 AM)(Optional)"></asp:TextBox>--%><br />
                        
                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="R" ControlToValidate="txtToTime" Display="Dynamic" ErrorMessage="Enter time in a valid format.(Ex. 12:30 AM)" ValidationExpression="^(1[0-2]|0[1-9]):[0-5][0-9]\040(AM|am|PM|pm)$"></asp:RegularExpressionValidator>         --%>
                 
                    </td>
                    <td></td>
                    </tr>
                     <tr> <td>
                   <strong>Comment:-</strong>&nbsp;</td>  <td>
                        <asp:TextBox ID="txtCommentsAdd" runat="server" Width="180px" TextMode="MultiLine" Height="60px" CssClass="textbox88" placeholder="Comment"></asp:TextBox>
                             
                 
                    </td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="R" ControlToValidate="txtCommentsAdd" ErrorMessage="*" ForeColor="Red"
                                    Display="Dynamic"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                    <td></td>
                     <td >
                        <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btn_Submit_Click" ValidationGroup="R" CssClass="BtnPrintHistory" /></td>
                    </tr>
            
            </table>
            </div>
            </asp:Panel>

    <script src="../Js/timepicki.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function divexpandcollapse(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline";
                img.src = "../images/Minus.png";
                img.title = "Hide Report";
            } else {
                div.style.display = "none";
                img.src = "../images/Plus.png";
                img.title = "View Report";
            }
        }
        
    </script>
   

</asp:Content>
