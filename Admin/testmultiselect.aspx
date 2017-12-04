<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true" CodeFile="testmultiselect.aspx.cs" Inherits="Admin_testmultiselect" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
  <%--<script src="Scripts/bootstrap-multiselect.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap-2.3.2.min.js" type="text/javascript"></script>
    <link href="Styles/bootstrap-3.1.1.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />--%>
    <script type="text/javascript">
        $(function () {
            $('[id*=lstHobbies]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<div style="padding:20px">
<select id="chkveg" multiple="multiple">
<option value="cheese">Cheese</option>
<option value="tomatoes">Tomatoes</option>
<option value="mozarella">Mozzarella</option>
<option value="mushrooms">Mushrooms</option>
<option value="pepperoni">Pepperoni</option>
<option value="onions">Onions</option>
</select><br /><br />
<input type="button" id="btnget" value="Get Selected Values" />
<script type="text/javascript">
$(function() {
debugger;
$('#chkveg').multiselect({
includeSelectAllOption: true
});
$('#btnget').click(function() {
alert($('#chkveg').val());
})
});
</script>
</div>--%>


    

    <div>
        <asp:ListBox ID="lstHobbies" runat="server" SelectionMode="Multiple"></asp:ListBox>
        <asp:Button ID="Button1" Text="UpdateHobbies" runat="server" />
    </div>
  
</asp:Content>

