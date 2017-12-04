<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PPL_ImagesPopup.aspx.cs"
    Inherits="PPLAudit_PPL_ImagesPopup" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery.fancybox.min.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.10.2.js" type="text/javascript"></script>

    <link href="../css/jquery.fancybox-thumbs.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        label {
            word-wrap: break-word;
            display: none;
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
        .glyphicon{ line-height:inherit;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DTLimages" runat="server" RepeatColumns="3" CellPadding="10" HorizontalAlign="Center">
            <ItemTemplate>
            <div style="padding:10px;">
            
            <div style="border: 1px solid; width: 200px;">
                <a  data-fancybox="images" href='<%# Eval("PhotoName","../PPLAudit/Photo_Page_Images/{0}") %>'><asp:Image ID="IMGppl" src='<%# Eval("PhotoName","../PPLAudit/Photo_Page_Images/{0}") %>'
                        Height="200px" Width="200px" runat="server" /></a>
                   <%-- <asp:Image ID="IMGppl" src='<%# Eval("PhotoName","../PPLAudit/Photo_Page_Images/{0}") %>'
                        Height="200px" Width="200px" runat="server" />--%>
                    <asp:CheckBox ID="CBimg" runat="server" Text='<%# Eval("PhotoName")%>' />
                </div>
            </div>
                
            </ItemTemplate>
            <ItemStyle Width="200px" Height="200px" VerticalAlign="Middle"/>
            
        </asp:DataList>
        <div style="text-align: center;">
            <asp:Button ID="btnDSelected" runat="server" class="top_btn" Text="Download Selected"
                OnClick="btnDSelected_Click" />
            <asp:Button ID="btnDAll" runat="server" class="top_btn" Text="Download All" OnClick="btnDAll_Click" />
        </div>

    </div>
    </form>
</body>
</html>

<script src="../Js/bootstrap.min.js" type="text/javascript"></script>
<script src="../Js/jquery.fancybox.min.js" type="text/javascript"></script>
<script type="text/javascript">
$( '[data-fancybox]' ).fancybox({
	onInit : function( instance ) {
		instance.$refs.downloadButton = $('<a class="fancybox-button fancybox-download" download><span class="glyphicon glyphicon-download-alt" style="color: white;"></span></a>')
			.appendTo( instance.$refs.buttons );
	},
	beforeMove: function( instance, current ) {
		instance.$refs.downloadButton.attr('href', current.src);
	}
});

</script>


 <%--<script src="../Js/jquery.fancybox-thumbs.js" type="text/javascript"></script>--%>



