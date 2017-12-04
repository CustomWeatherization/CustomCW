<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagePPLOrder.aspx.cs" Inherits="Admin_ManagePPLOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set Order Page</title>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="Styles/StyleSheet.css" />
    <style>
        .noselect
        {
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -o-user-select: none;
            user-select: none;
            cursor: move;
        }
        .tDnD_whileDrag
        {
            background-color: GrayText;
        }
    </style>

    <script type="text/javascript" src="Scripts/jquery-1.3.min.js"></script>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>

    <script type="text/javascript" src="Scripts/jquery.tablednd_0_5.js"></script>

    <script type="text/javascript" src="Scripts/jquery.highlightFade.js"></script>

    <%--<script src="Scripts/jquery.tablednd.js" type="text/javascript"></script>--%>

    <script type="text/javascript">

        var strorder;

        $(document).ready(function() {

            $('#GridViewReorder').tableDnD(

            {

                onDrop: function(table, row) {

                    reorder();

                    $.ajax({

                        type: "POST",

                        url: "ManagePPLOrder.aspx/GridViewReorders",

                        data: '{"Reorder":"' + strorder + '"}',

                        contentType: "application/json; charset=utf-8",

                        dataType: "json",

                        async: true,

                        cache: false,

                        success: function(msg) {
                            location.reload();
                            $("#loading").css("display", "none");
                        }
                    })
                }
            }

);
        });

        function reorder() {
            $("#loading").css("display", "block");
            strorder = "";

            var totalid = $('#GridViewReorder tr td input').length;


            for (var i = 0; i < totalid; i++) {

                strorder = strorder + $('#GridViewReorder tr td input')[i].getAttribute("value") + "|";

            }
        }
            
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="loading" style="position: absolute; width: 100%; height: 100%; padding-top: 250px;
            background: rgba(0, 0, 0, 0.54); z-index: 999; display: none; text-align: center;">
            <img src="../images/loading.gif" alt="Processing" />
        </div>
        <div>
            <div class="fix_div">
                <!-- header -->
                <div class="header">
                    <div class="logo_div">
                        <a href="../Home.aspx">
                            <img src="../images/logo.jpg" /></a></div>
                    <div class="header_middiv">
                        Customer Service
                        <br />
                        <%-- <asp:Button ID="btn_Print" runat="server" Text="Build Report" class="top_btn" OnClick="btn_Print_Click" />--%>
                        <%--OnClick="btn_Print_Click" --%>
                    </div>
                    <div class="head_right">
                        <div class="top_icons">
                            <ul>
                                <li>
                                    <%--<a href="../DisplayJobSearchRecords.aspx?InvoiceNo=<%=Request.QueryString["InvoiceNo"].ToString()%>&Jobs=<%=Request.QueryString["jobs"].ToString()%>&Utility=<%=Request.QueryString["Utility"].ToString()%>"
                                class="back" title="Back"></a>--%>
                                    <%-- <asp:LinkButton ID="lnkBtnBack" runat="server" class="back" title="Back" OnClick="lnkBtnBack_Click"></asp:LinkButton>--%>
                                </li>
                                <li><a href="../Home.aspx" class="home" title="Home"></a></li>
                                <li>
                                    <%--<a href="PPL_Audit_1.aspx?InvoiceNo=<%=Request.QueryString["InvoiceNo"].ToString()%>&Jobs=<%=Request.QueryString["jobs"].ToString()%>&Utility=<%=Request.QueryString["Utility"].ToString()%>"
                                    class="audit" title="Audit"></a>--%></li>
                            </ul>
                        </div>
                        <div class="clear">
                        </div>
                        <br />
                        <div class="head_link">
                            <span id="hed_link" runat="server"><a href="../admin/Admin_Login.aspx">Administer Database</a>
                                |</span>
                            <asp:LinkButton ID="lnkLogin" runat="server" Text="Logout"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="main_left" id="Quick_Link" style="margin-top: 8px;">
                    <h2>
                        Category</h2>
                    <ul id="selectable">
                        <asp:Repeater ID="rptr" runat="server" OnItemCommand="rptr_ItemCommand">
                            <ItemTemplate>
                                <li>
                                    <asp:LinkButton ID="lnkCategory" runat="server" CommandArgument='<%#Eval("CatID") %>'
                                        Text='<%#Eval("Category") %>'></asp:LinkButton></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <div class="main_right" style="min-height: 550px;">
                    <br />
                    <h1 align="center">
                        Manage Order</h1>
                    <br />
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
                    </asp:ScriptManager>
                    <div class="rounded_corners" style="width: 100%;">
                        <asp:GridView ID="GridViewReorder" runat="server" Width="100%" AutoGenerateColumns="False"
                            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                            AlternatingRowStyle-BackColor="White" EmptyDataText="No Record !!" RowStyle-ForeColor="#3A3A3A"
                            HeaderStyle-CssClass="nodrag nodrop">
                            <Columns>
                                <asp:TemplateField ItemStyle-CssClass="noselect" HeaderText="Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("SubCatId") %>' Visible="false"
                                            CssClass="noselect">
                                        </asp:Label>
                                        <asp:HiddenField ID="hdnid" runat="server" Visible="true" Value='<%# Bind("SubCatId") %>' />
                                        <%#Eval("Category")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="noselect" HeaderText="Sub Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("SubCatName") %>' CssClass="noselect"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
