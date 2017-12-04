<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    CodeFile="JobMessages.aspx.cs" Inherits="JobMessages" Title="Job Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- form section -->
    <div class="jobmsg">
        <h1>
            Job Messages</h1>
        <div class="unread_message">
            <a href="ViewMessages.aspx?UR=0"></a><span class="msg_count"><asp:Label ID="lblCountUnReadMsg" runat="server"></asp:Label></span>
        </div>
        <div class="read_message">
            <a href="ViewMessages.aspx?UR=1"></a><span class="msg_count"><asp:Label ID="lblCountReadMsg" runat="server"></asp:Label> </span>
        </div>
        <div class="sent_message">
            <a href="ViewMessages.aspx?UR=2"></a><span class="sentmsg_count">
               
           
            </span>
        </div>
        <div class="gen_message">
            <a href="GenralMessage.aspx?UR=3"></a>
        </div>
    </div>
    <div class="clear">
    </div>
    <div class="msg_text">
        <h3>
            Unread Messages</h3>
        <p>
            Messages that have been sent to you and you may have viewed (in hover mode) but 
            not marked as read.
        </p>
        <h3>
            Read Messages</h3>
        <p>
            Messages that you have read and marked as read. Soon you will be able to mark 
            them as unread if needed.</p>
        <h3>
            Sent Messages</h3>
        <p>
            Messages that you have sent to others. Using the drop down box, you may choose 
            one person or all employees. You will also be able to tell if someone has read 
            your message or not.</p>
        <h3>
            General Messages</h3>
        <p>
            Messages you send to others that are not job specific.</p>
    </div>
    <div class="clear">
    </div>
    <div class="btmsubmit">
      
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn_all" 
            onclick="btnCancel_Click" /> 
    </div>
    <!-- end form section -->
</asp:Content>
