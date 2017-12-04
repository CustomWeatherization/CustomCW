<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Photo_Page_Manage.aspx.cs" Inherits="METED_METED_Photo_Page_Manage"
    Title="Photo Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        img {
             page-break-before: auto; 
             page-break-after: auto; 
             page-break-inside: avoid;
            }
        label
        {
           display: none !important;
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
        .glyphicon
        {
            line-height: inherit;
        }
        .dtlImages        
        {
     padding-left: 4px;
    position: absolute;
    left: 31%;
    background: #fff;
    border: 2px solid #000;
    top: 15%;
    height: 538px;
    overflow: hidden;
    overflow-y: auto;
    display: block;
        }
        table#ctl00_ContentPlaceHolder1_Panel1
        {
            position: absolute;
            top: 95px;
            width: 225px;
            left: 375px;
            position: absolute;
            background-color: rgb(230, 230, 237);
            border: solid 3px black;
        }
        
        .auto-style1
        {
            height: 71px;
        }
         .glyphicon{ line-height:inherit !important;}
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
    
            <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery.fancybox.min.css" rel="stylesheet" type="text/css" />
    
    <script src="../Js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="../Js/jquery-migrate-1.2.1.js" type="text/javascript"></script>
    
    <link href="../css/jquery.fancybox-thumbs.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <link rel="Stylesheet" type="text/css" href="CSS/uploadify.css" />
    

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
                <td colspan="2">
                    <asp:TextBox ID="txt_title" runat="server" class="InputBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_txt_title" runat="server" ControlToValidate="txt_title"
                        ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    <b>Image :</b>
                </td>
                <td colspan="2">
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
                <td colspan="2">
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
                <td colspan="2">
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
                <td>
                    <asp:Button ID="btn_Downloadall" runat="server" Text="Download All" OnClick="btn_Downloadall_Click" CssClass="top_btn" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div>
        <asp:Panel ID="P1" runat="server" Style="display: none;">
                        <table id="Table3" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup cover-bg"
                            width="225px" style="border: 3px sold; position: fixed; top: 0; left: 0; width: 100%;
                            height: 100%; background: rgba(0, 0, 0, 0.33); padding-left: 4px; z-index: 9999;
                            padding-left: 4px; display: none">
                            <tr>
                                <td>
                                <div>
                                    <asp:DataList ID="DTLimages" runat="server" RepeatColumns="3" CellPadding="10" OnItemCommand="DTLimages_ItemCommand1" class="dtlImages">
                                        <HeaderTemplate>                                        
                                        <asp:LinkButton ID="btnDSelected" CommandName="btnDSelected" runat="server" CssClass="btn btn-info custombtn"><span class="glyphicon glyphicon-download-alt customspan"></span> Selected</asp:LinkButton>
                                            <asp:LinkButton ID="btnDAll" CommandName="btnDAll" runat="server" CssClass="btn btn-info custombtn" Text="Download All" ><span class="glyphicon glyphicon-download-alt customspan"></span> All</asp:LinkButton>
                                            <asp:LinkButton ID="btnPrint" CommandName="btnPrint" runat="server" CssClass="btn btn-info custombtn" Text="Print Selected" ><span class="glyphicon glyphicon-print customspan"></span> Selected </asp:LinkButton>
                                            <asp:LinkButton ID="btnPrintall" CommandName="btnPrintall" runat="server" CssClass="btn btn-info custombtn"><span class="glyphicon glyphicon-print customspan"></span> All</asp:LinkButton>
                                            <%--<asp:LinkButton ID="btnCancle" CommandName="btnCancle" runat="server" CssClass="btn btn-info custombtn" ><span class="glyphicon glyphicon-print customspan"></span> Close</asp:LinkButton>--%>
                                        
                                        </HeaderTemplate>
                                        <HeaderStyle HorizontalAlign=Center  CssClass ="gvhspadding" />
                                        
                                        <ItemTemplate>
                                            <div style="padding: 10px;">
                                                <div style="border: 1px solid; width: 200px;">
                                                    <a data-fancybox="images" href='<%# Eval("PhotoName","../NewMETED/Photo_Page_Images1/{0}") %>'>
                                                        <asp:Image ID="IMGppl" src='<%# Eval("PhotoName","../NewMETED/Photo_Page_Images1/{0}") %>'
                                                            Height="200px" Width="200px" runat="server" /></a>
                                                    <asp:CheckBox ID="CBimg" runat="server" Text='<%# Eval("PhotoName")%>' />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle Width="200px" Height="200px" VerticalAlign="Middle" />

                                    </asp:DataList>
                                </div>
                                </td>
                            </tr>
                        </table>                       
                    </asp:Panel>
        </div>
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
                            <asp:TextBox ID="txt_G_Title" runat="server" Width="80px" Text='<%#Eval("PhotoTitle")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_txt_G_Title" runat="server" ControlToValidate="txt_G_Title"
                                ErrorMessage="*" ValidationGroup="grd_rfv"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                        <a style="cursor: pointer" onclick="showDiv()">
                            <asp:Image ID="IMGBTNppl" runat="server" ImageUrl='<%# Eval("PhotoName","~/NewMETED/Photo_Page_Images1/{0}") %>'
                                Height="200px" Width="250px" /></a>
                            <%--<img src='../NewMETED/Photo_Page_Images1/<%#Eval("PhotoName")%>' alt="" height="50px"
                                width="50px" />--%>
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
                                TextMode="MultiLine" Height="40px" Width="280px"></asp:TextBox>
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


                    <asp:TemplateField HeaderText="Image For">
                        <ItemTemplate>
                          <asp:Label ID="lbl_ImageFor" runat="server" Text= '<%#Eval("ImageFor")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_G_ImageFor" runat="server">
                                 <asp:ListItem Value="None">Select</asp:ListItem>
                                <asp:ListItem Value="Attic">Attic</asp:ListItem>
                                <asp:ListItem Value="1Floor">1Floor</asp:ListItem>
                                <asp:ListItem Value="2Floor">2Floor</asp:ListItem>
                                <asp:ListItem Value="Bathroom">Bathroom</asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator ID="rfv_ddl_ImageFor" runat="server" ControlToValidate="ddl_ImageFor"
                                ErrorMessage="*" ValidationGroup="grd_rfv" InitialValue="Select"></asp:RequiredFieldValidator><br />--%>
                          
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
        <asp:HiddenField ID="HDNpath" runat="server"/>
 <script src="../Js/bootstrap.min.js" type="text/javascript"></script>

    <script src="../Js/jquery.fancybox.min.js" type="text/javascript"></script>

<%--    <script src="scripts/jquery.uploadify.v2.1.4.min.js" type="text/javascript"></script>--%>
 <script src="scripts/jquery.uploadify.js" type="text/javascript"></script>
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
    

    <script type="text/javascript">
            function closediv() {
     
            document.getElementById('<%=P1.ClientID%>').style.display = 'none';
        }
    
    
            function showDiv() {
       
            document.getElementById('<%=P1.ClientID%>').style.display = 'block';
            document.getElementById('<%=Table3.ClientID%>').style.display = 'block';    
            
            getfocus();
        }
        function getfocus() {
               
        }
    </script>
    
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
                    data: '{title: "' + $("#<%=txt_title.ClientID%>")[0].value + '",desc: "' + $("#<%=txt_Description_Line1.ClientID%>")[0].value + '",orderno: "' + $("#<%=txt_Order.ClientID%>")[0].value + '",jobno: "' + $("#<%=hdnJob.ClientID%>")[0].value + '",Inv: "' + $("#<%=hdnInv.ClientID%>")[0].value + '"}',  
                    //hdnInv, description: "' + $("<%=txt_Description_Line1.ClientID%>")[0].value + '", orderno: "' + $("<%=txt_Order.ClientID%>")[0].value + '" 
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
$( '[data-fancybox]' ).fancybox({
	onInit : function( instance ) {
		instance.$refs.downloadButton = $('<a class="fancybox-button fancybox-download" download><span class="glyphicon glyphicon-download-alt" style="color: white;"></span></a>')
			.appendTo( instance.$refs.buttons );
			instance.$refs.printButton = $('<a class="fancybox-button" onclick="PrintImage()"><span class="glyphicon glyphicon-print" style="color: white;"></span></a>')
			.appendTo( instance.$refs.buttons );
			},
	beforeMove: function( instance, current ) {
		instance.$refs.downloadButton.attr('href', current.src);
	var myHidden=  document.getElementById('<%= HDNpath.ClientID %>');
    if(myHidden)//checking whether it is found on DOM, but not necessary
        {
            myHidden.value=current.src;
        }
	  
	}
});

    </script>



    <script type="text/javascript">

        $(function() {
            document.getElementById('PagePhoto').classList.add("ui-selected");
        });
        
    </script>

    <script type="text/javascript">
        document.getElementById("PagePhoto").setAttribute("class", "ui-selected");   
    </script>
    
        <script type="text/javascript">
     var count=1;
     
$.fn.clickOff = function(callback, selfDestroy) {
    var clicked = false;
    var parent = this;
    var destroy = selfDestroy || true;
    
    parent.click(function() {
        clicked = true;
    });
    
    $(document).click(function(event) { 
        if (!clicked) {
            callback(parent, event);
        }
        if (destroy) {
            
        };
        clicked = false;
    });
};

$("#<%=DTLimages.ClientID%>").click(function() {
   
});

$("#<%=DTLimages.ClientID%>").clickOff(function() {

if(count !=1)
{
document.getElementById('<%=P1.ClientID%>').style.display = 'none';
count=1;
}
else{
count++;
}
   
});


    </script>
    
    
        <script type="text/javascript">
    function PrintImage()
        {
        debugger;        
        var imgpath=document.getElementById('<%= HDNpath.ClientID%>').value;
//            printWindow = window.open ("", "", "width=600,height=600");
//            printWindow.document.write(makepage(src));
//            printWindow.document.write("<div style='width:100%;'>");
//            printWindow.document.write("<img id='img' src='" +imgpath + "'/>");
//            printWindow.document.write("</div>");
//            printWindow.print();
//            printWindow.document.close(); 
            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
            var docprint = window.open("", "", disp_setting);
            docprint.document.open();
            docprint.document.write('<html><head><title>Custom Weatherization</title> ');
            docprint.document.write("<scr"+"ipt src='http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js'></scr"+"ipt>");    
            docprint.document.write('</head><body"><center>');               
            docprint.document.write('<img id="img" style="width:99%;" src="' +imgpath + '"/>');            
            docprint.document.write('</center>');
            docprint.document.write("<scr"+"ipt>$(document).ready(function(){setTimeout(function(){ window.print();}, 5000);});</scr"+"ipt>");
            docprint.document.write('</body></html>');
            docprint.document.close();
            docprint.focus();         
                 
        }
        
       

    </script>
    <script type="text/jscript">

    function MyFunction(srtpath)
    {
   
    closediv();
    
    var str_array = srtpath.split(',');
    var str="";
     for(var i=0;i<str_array.length;i++)
     {
      str +=' '+'<img style="width:27%; float:left; margin:20px;" src="../NewMETED/Photo_Page_Images1/'+str_array[i]+'"/>'
     }
     
            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
            var docprint = window.open("", "", disp_setting);
            docprint.document.open();
            docprint.document.write('<html><head><title>Custom Weatherization</title> ');
            docprint.document.write("<scr"+"ipt src='http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js'></scr"+"ipt>");  
             //docprint.document.write('<style type="text/css"> img { page-break-before: auto; page-break-after: auto; page-break-inside: avoid;}</style>');                               
            docprint.document.write('</head><body><center>');    
            docprint.document.write(str);                     
            docprint.document.write('</center>');
            docprint.document.write("<scr"+"ipt>$(document).ready(function(){setTimeout(function(){ window.print();}, 2000);});</scr"+"ipt>");
            docprint.document.write('</body></html>');
        
            docprint.document.close();  
              
            docprint.focus();
           
          
           }
    
    </script>

</asp:Content>
