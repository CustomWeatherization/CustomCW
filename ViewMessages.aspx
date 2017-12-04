<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    CodeFile="ViewMessages.aspx.cs" Inherits="ViewMessages" Title="View Messages"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- tooltip msg -->
    <link rel="stylesheet" href="css/jquery-ui.css">

    <script src="js/jquery-1.10.2.js"></script>

    <script src="js/jquery-ui.js"></script>

    <script>
        $(function() {

            $(document).tooltip({ html: true });
        });
    </script>

    <script type="text/javascript">
        function SelectAll(id) {

            //get reference of GridView control
            var grid = document.getElementById("<%= grdContactAttempts.ClientID %>");
            //variable to contain the cell of the grid
            var cell;

            if (grid.rows.length > 0) {
                //loop starts from 1. rows[0] points to the header.
                for (i = 1; i < grid.rows.length; i++) {
                    //get the reference of first column
                    cell = grid.rows[i].cells[0];

                    //loop according to the number of childNodes in the cell
                    for (j = 0; j < cell.childNodes.length; j++) {
                        //if childNode type is CheckBox                 
                        if (cell.childNodes[j].type == "checkbox") {
                            //assign the status of the Select All checkbox to the cell checkbox within the grid
                            cell.childNodes[j].checked = document.getElementById(id).checked;
                        }
                    }
                }
            }
        }
        
    </script>

    <!-- form section -->
    <%-- <asp:ScriptManager ID="scrpt" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="updatePanel1">
        <ContentTemplate>--%>
    <div class="msgsinnerpages">
        <div class="unread_message">
            <a href="ViewMessages.aspx?UR=0"></a><span style="top: -10px;" class="msg_count">
                <asp:Label ID="lblCountUnReadMsg" runat="server"></asp:Label></span>
        </div>
        <div class="read_message">
            <a href="ViewMessages.aspx?UR=1"></a>
            <%--<span style="top: -10px;" class="msg_count">
                <asp:Label ID="lblCountReadMsg" runat="server"></asp:Label>
            </span>--%>
        </div>
        <div class="sent_message">
            <a href="ViewMessages.aspx?UR=2"></a><span style="top: -10px;" class="sentmsg_count">
            </span>
        </div>
        <div class="gen_message">
            <a href="GenralMessage.aspx?UR=3"></a>
        </div>
    </div>
    <%--</ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpForgrd" runat="server">
        <ContentTemplate>--%>
    <div class="jobstatus">
        <%if (Request.QueryString["UR"] != null)
          {
              if (Request.QueryString["UR"] == "0")
              {
        %>
        <h1>
            UnRead Messages</h1>
        <%}
              else if (Request.QueryString["UR"] == "1")
              {%>
        <h1>
            Read Messages</h1>
        <%
            }
              else if (Request.QueryString["UR"] == "2")
              {%>
        <h1>
            Sent Messages</h1>
        <%}
          }%>
        <%-- <p>
                    You may hover over the text <strong>Read Message</strong> to get a preview of the
                    message without marking it as read, to save it for marking it as read later.
                </p>
                <p>
                    To read a message AND mark it as read, click on the hyperlink for the message. Doing
                    this will also give you a hyperlink to the job number on the Update Jobs Page. To
                    reply to the sender and include the message in the job itself you must click on
                    the job number link on the next page.</p>--%>
    </div>
    <div class="clear">
    </div>
    <div class="form_div">
        <%if (Request.QueryString["UR"] != null)
          {
              if (Request.QueryString["UR"] == "2")
              { 
        %>
        <table width="70%">
            <tr>
                <td>
                    Search By Employee Name
                </td>
                <td>
                    <%--<asp:TextBox ID="txtRecepentName" runat="server" ></asp:TextBox>--%>
                    <asp:DropDownList ID="ddlRecentName" runat="server" OnSelectedIndexChanged="ddlRecentName_SelectedIndexChanged"
                        AutoPostBack="true">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnViewAll" runat="server" Text="View All" class="btn_all" OnClick="btnSearch_Click" />
                </td>
            </tr>
        </table>
        <%}
          }%>
    </div>
    <div>
        <%if (Request.QueryString["UR"] == "0")
          {
        %>
        <asp:ImageButton ID="btnDeleteUnread" runat="server" ImageUrl="~/images/delete_it.png"
            OnClick="btnDeleteRead_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="btnMsgReadUnread" runat="server" ImageUrl="~/images/MailOpen.png"
            OnClick="btnMsgReadUnread_Click" />
        <%}
          else if (Request.QueryString["UR"] == "1")
          {
        %>
        <asp:ImageButton ID="BtnDeleteRead" runat="server" ImageUrl="~/images/delete_it.png"
            OnClick="btnDeleteRead_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="btnMsgUnreadRead" runat="server" ImageUrl="~/images/emailIcon.png"
            OnClick="btnMsgReadUnread_Click" /><div style="float: right;">
                Search By Employee Name
                <asp:DropDownList ID="ddlread" runat="server" OnSelectedIndexChanged="ddlread_SelectedIndexChanged"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: Black; border-radius: 5px; padding: 8px; margin: 0;" AutoPostBack="true">
                </asp:DropDownList>
            </div>
        <%} %>
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Style="float: right; margin-right: 38%;word-wrap:break-word; "></asp:Label>
        <%-- <asp:Label ID="Label1" runat="server" ForeColor="Red" Style="float: right; margin-right: 38%;" Text="Search by Employee Name"></asp:Label>--%>
    </div>
    <div class="grid vm" id="DivUnread" Width="100%">
        <asp:GridView ID="grdContactAttempts" runat="server" AutoGenerateColumns="false"
            HeaderStyle-CssClass="fixedheader" DataKeyNames="JobNumber,MID" Width="100%"
            BorderColor="Transparent" GridLines="None" OnRowDataBound="GrdSecFilling_RowDataBound"
            EmptyDataText="No Outstanding messages were found.">
          
            <Columns>
                <asp:TemplateField HeaderStyle-Width="45px" ItemStyle-Width="50px">
                    <AlternatingItemTemplate>
                        <asp:CheckBox ID="ChkReadUnread" runat="server" EnableViewState="true" />
                    </AlternatingItemTemplate>
                    <HeaderTemplate>
                        <asp:CheckBox ID="ChkReadUnread" ToolTip="Select" runat="server" Text=""  />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="ChkReadUnread" runat="server" EnableViewState="true" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sender Name" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <%#Eval("FirstName")%>
                        <%#Eval("LastName")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Number" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <asp:Label ID="lblGJobNumber" runat="server" Text='<%#Eval("JobNumber")%>'></asp:Label>
                        <asp:Label ID="lbl_Dash_" Style="float: right; margin-right: 75%;" runat="server"
                            Text="-" Visible="false"></asp:Label>
                        <asp:HiddenField ID="HdnGMID" runat="server" Value='<%#Eval("MID")%>' />
                        <asp:HiddenField ID="HdnReanUnread" runat="server" Value='<%#Eval("MessageReadOrUnRead")%>' />
                           <asp:HiddenField ID="hdnComment" runat="server" Value='<%#Eval("Comments")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Read Message" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <a class="setpos">
                            
                                <span id="divMsgLeave" runat="server" class="hoverdivancor" > <%--class="hoverdiv" --%>
                                
                                    <asp:Label runat="server" ID="lblCommentDetailsShow" style="width: 220px;clear: both;float: left;padding: 10px 10px;" Visible="false">
                              <%--  <lable>--%>
                                        <%#!DBNull.Value.Equals(Eval("Comments")) && !DBNull.Value.Equals(Eval("FromDate")) ? "From Date : " + Convert.ToDateTime(Eval("FromDate")).ToShortDateString() : ""%><br /><%#!DBNull.Value.Equals(Eval("Comments")) && !DBNull.Value.Equals(Eval("ToDate")) ? "To Date : " + Convert.ToDateTime(Eval("ToDate")).ToShortDateString() : ""%><br />
                                        <%#!DBNull.Value.Equals(Eval("Comments")) && !DBNull.Value.Equals(Eval("FromTime")) ? "From Time : " + (Eval("FromTime") != string.Empty ? Eval("FromTime") : " N/A ") : ""%><%#!DBNull.Value.Equals(Eval("Comments")) && !DBNull.Value.Equals(Eval("ToTime")) ? "To Time :" + (Eval("ToTime") != string.Empty ? Eval("ToTime") : " N/A ") : ""%><br />
                                        <%#!DBNull.Value.Equals(Eval("Comments")) && !DBNull.Value.Equals(Eval("TypeOfRequesteType")) ? "Requeste Type : " + Eval("TypeOfRequesteType") : ""%><br />
                                       
                                        <%#Eval("TextMessage") != null ? "Comments : "+Eval("TextMessage") : "N/A"%>                   
                            <%--  </lable>--%>
                                        </asp:Label>
                                           <asp:Label runat="server" ID="lblCommentShowOnly" style="width: 200px;clear: both;float: left;padding: 10px 10px;" >
                                            <%#Eval("TextMessage") != null ? Eval("TextMessage") : "N/A"%>                   
                              
                                        </asp:Label>
                                        
                                </span>
                            
                            <asp:ImageButton ID="lblMSGIcon" runat="server" Width="25" Visible="false" OnClick="lblMSGIcon_Click" />
                            <asp:ImageButton ID="imgRMessage" runat="server" Width="25" Visible="false" OnClick="imgRMessage_Click" />
                            <asp:ImageButton ID="imgOMessage" runat="server" Width="25" Visible="false" OnClick="imgOMessage_Click" /><%--OnClick="lblMSGIcon_Click"--%>
                            <asp:ImageButton ID="tmbtn" runat="server" Width="25" OnClick="tmbtn_Click" />
                        </a>
                        <%--</asp:Label>--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Recipient Name" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnMessageCC" runat="server" Value='<%#Eval("MessageCC")%>' />
                        <%--<asp:Label ID="lblReceipientName" runat="server" Text='<%#Eval("StrRecName")%>'></asp:Label>--%>
                      <%--  <%#Eval("StrRecName")%>--%>
                        <%=StrRecName%>
                        <div>
                            <asp:Label ID="lblCCSi" runat="server" ForeColor="Red" Text="Cc"></asp:Label>
                            <span id="divMsgCnt" runat="server" class="hoverdiv">
                                <label>
                                    <%#Eval("MessageFrom")%></label>
                                <label>
                                    <%#Eval("MessageTo")%></label>
                                <label>
                                    <%#Eval("MessageCC")%></label>
                            </span>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Customer" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <asp:Label ID="lblCustomerLastName" runat="server" Text='<%#Eval("CustomerLastName")%>'></asp:Label>
                        <asp:Label ID="lblCustomerFirstName" runat="server" Text='<%#Eval("CustomerFirstName")%>'></asp:Label><br />
                        <asp:Label ID="lblCustomerServiceAddress1" runat="server" Text='<%#Eval("CustomerServiceAddress1")%>'></asp:Label>
                        <asp:Label ID="lblCustomerServiceCity" runat="server" Text='<%#Eval("CustomerServiceCity")%>'></asp:Label><br />
                        <asp:Label ID="lblStateName" runat="server" Text='<%#Eval("StateName")%>'></asp:Label>
                        <asp:Label ID="lblCustomerServiceZipCode" runat="server" Text='<%#Eval("CustomerServiceZipCode")%>'></asp:Label>
                        <asp:Label ID="lblSenderUserID" runat="server" Text='<%#Eval("SenderUserID")%>' Visible="false"></asp:Label>
                        <asp:Label ID="lblDateTimeSent" runat="server" Text='<%#Eval("DateTimeSent")%>' Visible="false"></asp:Label>
                        <asp:Label ID="lblRequestType" runat="server" Text='<%#Eval("RequestType")%>' Visible="false"></asp:Label>
                        <asp:Label ID="lbl_Dash" Style="float: right; margin-top: -21px; margin-right: 86%;"
                            runat="server" Text="-" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <%#Eval("DateTimeSent", "{0:MM/dd/yyyy HH:mm:tt}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnknote" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Mid")%>'
                            CommandName="View" Text="" OnClientClick="convertMsgToRead();">
                        Reply</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnknoteAll" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Mid")%>'
                            CommandName="View" Text="" OnClientClick="convertMsgToRead();">Reply All</asp:LinkButton>
                        <asp:Label ID="lblMessageType" runat="server" Text='<%#Eval("MessageType")%>' Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnGrdBind" runat="server" Text="Button" OnClick="btnGrdBind_Click"
            CssClass="HideButton" />
        <%-- Grid view for View and Send Message--%>
        <asp:GridView ID="GrdViewSend" runat="server" AutoGenerateColumns="false" DataKeyNames="JobNumber"
            HeaderStyle-CssClass="fixedheader" Width="100%" BorderColor="Transparent" GridLines="None"
            EmptyDataText="No Outstanding messages were found." OnRowDataBound="GrdViewSend_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Sender Name" HeaderStyle-Width="130px" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <%=StrRecName%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Number" HeaderStyle-Width="110px" ItemStyle-Width="130px">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Job_Number" runat="server" Text='<%#Eval("JobNumber")%>'></asp:Label>
                        <asp:Label ID="lbl__dash_" runat="server" Style="float: right; margin-right: 75%;"
                            Visible="false" Text="-"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Read or Unread" HeaderStyle-Width="130px" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <%# Convert.ToString(Eval("MessageReadOrUnRead")) == "U" ? "<input type='checkbox' disabled='disabled'/> Unread" : "<input type='checkbox' checked='checked' disabled='disabled'/> Read"%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Message Sent" HeaderStyle-Width="110px" ItemStyle-Width="130px">
                    <ItemTemplate>
                        <a title='<%#Eval("TextMessage")%>' href="#">
                            <asp:Image ID="ImgIco" runat="server" Width="25" />
                            <span class="tip" style="width: 400px;">
                                <%#Eval("TextMessage")%></span></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Recipient Name" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnMessageCC" runat="server" Value='<%#Eval("MessageCC")%>' />
                        <%#Eval("FirstName")%>
                        <%#Eval("LastName")%>
                        <div>
                            <asp:Label ID="lblCCSi" runat="server" ForeColor="Red" Text="Cc"></asp:Label>
                            <span id="divMsgCnt" runat="server" class="hoverdiv">
                                <label>
                                    <%#Eval("MessageFrom")%></label>
                                <label>
                                    <%#Eval("MessageTo")%></label>
                                <label>
                                    <%#Eval("MessageCC")%></label>
                            </span>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Customer" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <asp:Label ID="lbl_CustomerLastName" runat="server" Text='<%#Eval("CustomerLastName")%>'></asp:Label>
                        <asp:Label ID="lbl_CustomerFirstName" runat="server" Text='<%#Eval("CustomerFirstName")%>'></asp:Label><br />
                        <asp:Label ID="lbl_CustomerServiceAddress1" runat="server" Text='<%#Eval("CustomerServiceAddress1")%>'></asp:Label>
                        <asp:Label ID="lbl_CustomerServiceCity" runat="server" Text='<%#Eval("CustomerServiceCity")%>'></asp:Label><br />
                        <asp:Label ID="lbl_StateName" runat="server" Text='<%#Eval("StateName")%>'></asp:Label>
                        <asp:Label ID="lbl_CustomerServiceZipCode" runat="server" Text='<%#Eval("CustomerServiceZipCode")%>'></asp:Label>
                        <asp:Label ID="lbl__Dash" Style="float: right; margin-top: -21px; margin-right: 86%;"
                            runat="server" Text="-" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" HeaderStyle-Width="147px" ItemStyle-Width="167px">
                    <ItemTemplate>
                        <%#Eval("DateTimeSent", "{0:MM/dd/yyyy HH:mm:tt}")%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="clear">
    </div>
    <div class="btmsubmit">
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="false" class="btn_all"
            OnClick="btnCancel_Click" />
    </div>
    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <!-- end form section -->

    <script type="text/javascript">
        function convertMsgToRead() {
            var id = document.getElementById('<%=btnGrdBind.ClientID %>').name;
            __doPostBack(id, 'btnGrdBind_Click');
        }
    </script>

</asp:Content>
