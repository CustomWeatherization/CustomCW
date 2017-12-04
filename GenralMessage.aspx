<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    CodeFile="GenralMessage.aspx.cs" Inherits="GenralMessage" Title="Genral Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- tooltip msg -->
    <link rel="stylesheet" href="css/jquery-ui.css">

    <script src="js/jquery-1.10.2.js"></script>

    <script src="js/jquery-ui.js"></script>

    <script>
  $(function() {
    $( document ).tooltip();
  });
    </script>

    <!-- form section -->
    <div class="msgsinnerpages">
        <div class="unread_message">
            <a href="ViewMessages.aspx?UR=0"></a><span style="top: -10px;" class="msg_count">
                <asp:Label ID="lblCountUnReadMsg" runat="server"></asp:Label></span>
        </div>
        <div class="read_message">
            <a href="ViewMessages.aspx?UR=1"></a><%--<span style="top: -10px;" class="msg_count">
                <asp:Label ID="lblCountReadMsg" runat="server"></asp:Label>
            </span>--%>
        </div>
        <div class="sent_message">
            <a href="ViewMessages.aspx?UR=2"></a><span style="top: -10px;" class="sentmsg_count">
            </span>
        </div>
        <div class="gen_message">
            <a href="GenralMessage.aspx?UR=2"></a>
        </div>
    </div>
    <div class="jobstatus noborder" align="center">
        <h1>
            General Messages</h1>
        <p>
            Send a message not related to a job number. Use control and click to select multiple
            users.
        </p>
        <table>
            <tr>
                <td>
                    <b>To: </b>
                </td>
                <td>
                    <b>Cc:</b>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="lstEmployeeForSendSaveComments" runat="server" SelectionMode="Multiple">
                    </asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**"
                        ValidationGroup="G" ControlToValidate="lstEmployeeForSendSaveComments"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:ListBox ID="lstEmployeeForSendSaveCommentsCC" runat="server" SelectionMode="Multiple">
                    </asp:ListBox>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <p>
            Reply to the Message Below:</p>
        <asp:TextBox ID="txtMessageReply" runat="server" TextMode="MultiLine" Columns="150"
            Rows="10"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="**" ValidationGroup="G"
            ControlToValidate="txtMessageReply"></asp:RequiredFieldValidator>
        <br />
        <br />
        <div class="btmsubmit">
            <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Green" Font-Bold="true"
                Font-Size="16px"></asp:Label>
            <br />
            <br />
        </div>
        <div class="btmsubmit">
            <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click"
                class="btn_all" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                Visible="false" class="btn_all" />
        </div>
        <br />
        <br />
        <%--<p>
            Below is the Message History That Was Sent To You:</p>--%>
        <div class="grid">
            <asp:GridView ID="grdPreviousComment" runat="server" AutoGenerateColumns="false"
                Visible="false" DataKeyNames="JobNumber" Width="100%" BorderColor="Transparent"
                GridLines="None" EmptyDataText="No Outstanding messages were found.">
                <Columns>
                    <asp:TemplateField HeaderText="Sender Name">
                        <ItemTemplate>
                            <%#Eval("CustomerFirstName")%>
                            <%#Eval("CustomerLastName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Read Message">
                        <%--<ItemTemplate>
                            <a class="ttip_trigger" href="#">
                                <img src="images/msg.png" width="25" alt="" />
                                <span class="tip" style="width: 400px;">
                                    <%#Eval("TextMessage")%></span></a>
                        </ItemTemplate>--%>
                        <ItemTemplate>
                            <a title='<%#Eval("TextMessage")%>' href="#">
                                <img src="images/genunread.png" width="25" />
                                <%--<asp:ImageButton ID="tmbtn" runat="server" ImageUrl="images/msg.png" Width="25" OnClick="tmbtn_Click" />--%>
                                <%-- <span class="tip" style="width: 400px;">
                                    <%#Eval("TextMessage")%></span>--%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Recipient Name">
                        <ItemTemplate>
                            <%--<%=StrRecName%>--%>
                            <%#Eval("FirstName")%>
                            <%#Eval("LastName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <%#Eval("DateTimeSent")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
</asp:Content>
