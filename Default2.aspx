<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Editable TextBox Demo</title>
<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
   <%--<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
   <script type="text/javascript">
       $(document).ready(function() {
           $(".lnkbtn").click(function() {
               var role = $(this).find('.role');
               var value = $(this).siblings();
               var values = value.text();
               if (role.html() == "Edit") {
                   role.html("Save");
                   if (values == "enter username" || values == "enter title" || values == "enter email address") {
                       values = "";
                   }
                   $(this).siblings().html('<input type="textbox" class="txtbox" value="' + values + '" placeholder="enter username">');
               } else {
                   if (value.find('.txtbox').val() != "") {
                       $(this).siblings().html('<span class="editlabel">' + value.find('.txtbox').val() + '</span>');
                       role.html("Edit");
                   } else {
                       alert("Please Fill the field");
                   }
               }
           });
       });  
</script>--%>
<%--<style>
.control-label .text-info { display:inline-block; }
</style>
--%>
</head>
<body>
    <form id="form1" runat="server">
    <asp:TextBox ID="amount_entry" runat="server" style="display:none"></asp:TextBox>
<%-- <span id="amount">3.25</span>--%>
<asp:Label ID="amount" runat="server">3.25</asp:Label>
 <asp:Image class="imgAdd" ID="imgAdd" runat="server" ImageUrl="Admin/images/minus7.png" Height="15px" Width="15px" />
<%--<div class="controls">
--%>  <%-- <a href="#" id="edit" class="btn">Edit</a>--%>
<%--</div>--%>
 
    </form>
    <script type="text/javascript">
        $('#imgAdd').click(function() {
            debugger;
            $('#amount').css('display', 'none');
            $('#amount_entry')
        .val($('#amount').text())
        .css('display', '')
        .focus();
        });

        $('#amount_entry').blur(function() {
            $('#amount_entry').css('display', 'none');
            $('#amount')
        .text($('#amount_entry').val())
        .css('display', '');
        });
</script>

</body>
</html>