<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="VendorPayments.aspx.cs" Inherits="VendorPayments" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../css/default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.ChildGrid
{
    height:10px;
    width:100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="top_links" runat="server" id="TopBtnDiv" 
        style="width:30%; left: 514px;">
       <%-- <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
        </b>
        <br />
      --%>
        <asp:Button ID="btn_cancel" runat="server" Text="Back" class="top_btn" 
            onclick="btn_cancel_Click" />&nbsp;&nbsp;
        
        <%--OnClientClick="ClickHereToPrintFull()"--%>
    </div>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$( "[id*=ExpandRow]" ).each(function() {
   $(this).closest("tr").after("<tr style='padding:20px;'><td id='InvoiceRow' colspan = '999'>" + $(this).next().html() + "</td></tr>")
     $(this).attr("src", "images/Minus.png");
  });
    
});
    $("[id*=ExpandRow]").live("click", function () {
    var row =  $(this).closest('tr').next().find('td').attr('id');
  //  var next = row.next();
    if(row !="InvoiceRow")
    {
     $(this).closest("tr").after("<tr style='padding:20px;'><td id='InvoiceRow' colspan = '999'>" + $(this).next().html() + "</td></tr>")
     $(this).attr("src", "images/Minus.png");
    }
    else{
    $(this).closest("tr").next().remove();
    $(this).attr("src", "images/Plus.png");
    }
       
        
    });
//    $("[id*=ExpandRow]").live("click", function () {
//     debugger;
//       // $(this).attr("src", "images/plus.png");
//        
//    });
</script>
 <div class="rounded_corners" style="width: 99%;">
<asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" CssClass="Grid" 
         DataKeyNames="VendorJobNumber" OnRowDataBound="gvCustomers_OnRowDataBound" 
         CellPadding="3" AllowPaging="True" PageSize="20" 
         onpageindexchanging="gvCustomers_PageIndexChanging">
<RowStyle BackColor="#A1DCF2" ForeColor="#3A3A3A"></RowStyle>
    <Columns>
        <asp:TemplateField HeaderText="Expand">
            <ItemTemplate>
           <%-- <asp:Image id="VendorImage" style="cursor: pointer" AlternateText="Image Cover" ImageUrl='<%# Eval("VendorImgPath","~/VendorImage/{0}") %>' />--%>
                <img alt="" id="ExpandRow" src="images/Plus.png" style="cursor: pointer;" />
                <asp:Panel ID="pnlOrders" CssClass="rounded_corners" runat="server" Style="display: none;" >
                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid" HeaderStyle-BackColor="#3AC0F2" CellPadding="10"
                    HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" >
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="InvoiceId" HeaderText="Invoice Id" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="InvoiceNo" HeaderText="Invoice No #" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="InvoiceAmnt" HeaderText="Invoice Amount" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="InvoiceDate" HeaderText="Invoice Date" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="DueDate" HeaderText="Due Date" />
                           
                            <asp:HyperLinkField Text="Pay" HeaderText="Pay" SortExpression="VendorJobNumber" DataNavigateUrlFields="VendorJobNumber" DataNavigateUrlFormatString="Vendor/VendorInvoice.aspx?Jobs={0}&GT=Vendor&Back=DisplayJobSearchRecords" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
        <img alt="" id="VendorImage" runat="server" src='<%# Eval("VendorImgPath","~/VendorImage/{0}") %>' style="cursor: pointer; width:auto; height:40px;" />
        </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField ItemStyle-Width="800px" DataField="VendorJobNumber" 
            HeaderText="Vendor Job Number" ItemStyle-Font-Bold="true" >
<ItemStyle Font-Bold="True" Width="800px"></ItemStyle>
        </asp:BoundField>
    </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>

<AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
</asp:GridView>
</div>
</asp:Content>

