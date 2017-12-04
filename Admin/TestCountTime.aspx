<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true" CodeFile="TestCountTime.aspx.cs" Inherits="Admin_TestCountTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:GridView ID="gvParentGrid" runat="server" DataKeyNames="Emp_Id" Width="300"
            AutoGenerateColumns="false" OnRowDataBound="gvUserInfo_RowDataBound" GridLines="None"
            BorderStyle="Solid" BorderWidth="1px" BorderColor="#df5015">
            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
            <RowStyle BackColor="#E1E1E1" />
            <AlternatingRowStyle BackColor="White" />
            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
            <Columns>
                <asp:TemplateField ItemStyle-Width="20px">
                    <ItemTemplate>
                        <a href="JavaScript:divexpandcollapse('div<%# Eval("Emp_Id") %>');">
                            <img id="imgdiv<%# Eval("Emp_Id") %>" width="9px" border="0" src="../images/Plus.png" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Emp_Id" HeaderText="Emp_Id" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="FullName" HeaderText="FullName" HeaderStyle-HorizontalAlign="Left" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <tr>
                            <td colspan="100%">
                                <div id="div<%# Eval("Emp_Id") %>" style="display: none; position: relative; left: 15px;
                                    overflow: auto">
                                    <asp:GridView ID="gvChildGrid" runat="server" AutoGenerateColumns="false" BorderStyle="Double"
                                        BorderColor="#df5015" GridLines="None" Width="250px">
                                        <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                        <RowStyle BackColor="#E1E1E1" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Emp_Id" HeaderText="Emp_Id" HeaderStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="FullName" HeaderText="FullName" HeaderStyle-HorizontalAlign="Left" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <script language="javascript" type="text/javascript">
        function divexpandcollapse(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline";
                img.src = "../images/Minus.png";
            } else {
                div.style.display = "none";
                img.src = "../images/Plus.png";
            }
        }
    </script>

</asp:Content>