<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageDCEDEstimate.aspx.cs"
    Inherits="DCED_ManageDCEDEstimate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
     <link href="../images/favicon.ico" rel="icon" type="image/x-icon" />
    <style>
         #lnkBtnBack
        {
             height:20px;
            width:20px;
            }
        #div
        {
            display: none;
        }
        #Div
        {
            float: left;
            border: 3px solid #DEB887;
            border-radius: 5px;
            padding: 15px;
            width: 950px;
        }
        #Btn_back
        {
            display: none;
        }
        .wrapper
        {
            margin: 0 auto;
            width: 990px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
        .line
        {
            width: 100%;
            float: left;
            height: 1px;
            background: #000;
            margin-top: 20px;
        }
        .full-left
        {
            width: 100%;
            float: left;
        }
        .blue
        {
            background: #009;
        }
        .wrapper-box
        {
            float: left;
            border: 3px solid #deb887;
            border-radius: 5px;
            padding: 15px;
        }
        .nm
        {
            width: auto !important;
            padding-right: 5px;
        }
        .tab-secion table tr td
        {
            width: 23%;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div class="fix_div">
        <!-- header -->
        <div class="header">
            <div class="logo_div">
                <a href="../Home.aspx">
                    <img src="../images/logo.jpg" /></a></div>
            <div class="header_middiv">
                Customer Service
                <br />
                <asp:Button ID="btn_Print" runat="server" Text="Build Report" class="top_btn" OnClick="btn_Print_Click" />
                <asp:Button ID="Btn_View" runat="server" Text="View" class="top_btn" OnClick="Btn_View_Click" />
                <asp:Button ID="btn_SaveNormal" runat="server" Text="Save" class="top_btn" OnClick="btn_SaveNormal_Click" />
                <asp:Button ID="Btn_back123" runat="server" Text="Back" class="top_btn" Visible="false"
                    OnClientClick="HideInvoice()" OnClick="Btn_back123_Click" />
                <%-- <br />
                <asp:CheckBox ID="chk_submitDate" runat="server" /><span style="font-size: 12px;"> Change
                    Submit Date</span>--%>
            </div>
            <div class="head_right">
                <div class="top_icons">
                    <ul>
                        <li>
                            <%--<a href="../DisplayJobSearchRecords.aspx?InvoiceNo=<%=Request.QueryString["InvoiceNo"].ToString()%>&Jobs=<%=Request.QueryString["jobs"].ToString()%>&Utility=<%=Request.QueryString["Utility"].ToString()%>"
                            class="back" title="Back"></a>--%>
                            <asp:LinkButton ID="lnkBtnBack" runat="server" class="back" title="Back" OnClick="lnkBtnBack_Click"></asp:LinkButton>
                        </li>
                        <li><a href="../Home.aspx" class="home" title="Home"></a></li>
                        <%--<li><a href="PPL_Audit_1.aspx?InvoiceNo=<%=Request.QueryString["InvoiceNo"].ToString()%>&Jobs=<%=Request.QueryString["jobs"].ToString()%>&Utility=<%=Request.QueryString["Utility"].ToString()%>"
                            class="audit" title="Audit"></a></li>--%>
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
        <div class="te" id="mainformat" runat="server">
            <div class="main_left" id="Quick_Link" style="margin-top: 0px;">
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
            <div class="main_right" style="min-height: 500px;">
                <table class="t-border" width="100%">
                    <tr>
                        <td>
                            <b>Customer Name:</b>
                            <asp:Literal ID="lbl_name" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <b>Job Number:</b>
                            <asp:Literal ID="lbl_jobno" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <b>Phone:</b>
                            <asp:Literal ID="lbl_phone" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
                <br />
                <table align="center">
                    <tr>
                        <td colspan="3" align="center">
                            <strong>Completed Date:</strong>&nbsp;&nbsp;
                            <asp:TextBox ID="txt_cal" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 70px;"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_cal"
                                Format="MM/dd/yyyy">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                </table>
                <br />
                <table align="center">
                    <tr>
                        <td colspan="3" align="center">
                            <asp:RadioButton ID="rdo_Standard" runat="server" GroupName="RowType" Checked="true"
                                onclick="Test(this);" /><strong>Standard</strong>&nbsp;&nbsp;<asp:RadioButton ID="rdo_Custom"
                                    runat="server" GroupName="RowType" onclick="Test(this);" /><strong>Custom</strong>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>QTY:</strong>
                            <asp:TextBox ID="txt_Qty" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 70px;"
                                MaxLength="40" onkeyup="CalculateLine()"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_txt_Qty" runat="server" ErrorMessage="*" ControlToValidate="txt_Qty"
                                ValidationGroup="rfv"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <strong>MEASURE DESCRIPTION: </strong>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDl_MEASURE_DESCRIPTION" runat="server" Style="border: 1px solid #ccc;
                                font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                                padding: 8px; margin: 0; width: 318px;">
                            </asp:DropDownList>
                            <%-- <asp:RequiredFieldValidator ID="RFV_DDl_MEASURE_DESCRIPTION" runat="server" ErrorMessage="*"
                                Display="Dynamic" InitialValue="Select" ControlToValidate="DDl_MEASURE_DESCRIPTION"
                                ValidationGroup="rfv"></asp:RequiredFieldValidator>--%>
                            <asp:TextBox ID="txt_MEASURE_DESCRIPTION" runat="server" Style="border: 1px solid #ccc;
                                font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                                padding: 8px; margin: 0; width: 318px; display: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr id="trEditLabor" runat="server" visible="false">
                        <td colspan="3">
                            <strong>Labor Rate:</strong><asp:TextBox ID="txtEditLabor" runat="server" Style="border: 1px solid #ccc;
                                font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                                padding: 8px; margin: 0; width: 150px;" MaxLength="40" onkeyup="CalculateLineEditLaborRate()"></asp:TextBox>
                            <strong>Cost Per Unit:</strong>
                            <asp:TextBox ID="txtEditCost" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <div id="courier" runat="server" style="display: none">
                    <table align="center">
                        <tr>
                            <td colspan="2">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <strong style="display: none;">Location: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Location" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" Visible="false"></asp:TextBox>
                                        </td>
                                        <td>
                                            <strong>S/C: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_SC" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onkeyup="CalculateLineSC()"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Liurp Code: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Liurp" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onkeyup="CalculateLineCode()"></asp:TextBox>
                                        </td>
                                        <td>
                                            <strong>Unit: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Unit" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Labor Rate: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_LaborRate" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onkeyup="CalculateLineLaborRate()"></asp:TextBox><%--onkeyup="CalculateLineLaborRate()"--%>
                                            <asp:HiddenField ID="hdn_txt_MinLaborRate" runat="server" />
                                            <asp:HiddenField ID="hdn_txt_MaxLaborRate" runat="server" />
                                        </td>
                                        <td>
                                            <strong>THW: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_THW" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onkeyup="CalculateLineTHW()"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>TMC: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_TMC" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onkeyup="CalculateLineTMC()"></asp:TextBox>
                                        </td>
                                        <td>
                                            <strong>Total:</strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Total" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <table align="center">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnSave" runat="server" Text="Add Row" class="top_btn" Style="margin-left: 70px;"
                                ValidationGroup="rfv" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="top_btn" OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <div class="rounded_corners" style="width: 100%;">
                    <asp:GridView ID="grdContainOfInvoice" runat="server" Width="100%" DataKeyNames="InvoiceRowId"
                        EmptyDataText="No Record !!" AutoGenerateColumns="false" HeaderStyle-BackColor="#3AC0F2"
                        HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                        RowStyle-ForeColor="#3A3A3A" OnRowDeleting="grdContainOfInvoice_RowDeleting"
                        OnRowUpdating="grdContainOfInvoice_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <%#Eval("Category")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="MEASURE DESCRIPTION">
                                <ItemTemplate>
                                    <%#Eval("SubCategory")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="Location">
                                <ItemTemplate>
                                    <%#Eval("Location")%>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="S/C">
                                <ItemTemplate>
                                    <%#Eval("SC")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Liurp Code">
                                <ItemTemplate>
                                    <%#Eval("LiurpCode")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Unit">
                                <ItemTemplate>
                                    <%#Eval("Unit")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Labor Rate">
                                <ItemTemplate>
                                    <%#Eval("LaborRate")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="THW">
                                <ItemTemplate>
                                    <%#Eval("THW")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TMC">
                                <ItemTemplate>
                                    <%#Eval("TMC")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cost Per Unit">
                                <ItemTemplate>
                                    <%#Eval("CostPerUnit")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QTY">
                                <ItemTemplate>
                                    <%#Eval("QTY")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total">
                                <ItemTemplate>
                                    <%#Eval("Total")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_Edit" runat="server" Text="Edit" CommandName="Update"></asp:LinkButton>
                                    <asp:LinkButton ID="lnk_Delete" runat="server" Text="Delete" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this Record?');"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <%-- --%>
        <div class="wrapper" id="Div" runat="server" visible="false" style="margin-top: 45px;">
            <div class="left-section tab-secion">
                <table width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="120px" class="nm">
                            <strong>Customer Name:</strong>
                        </td>
                        <td>
                            <asp:Label ID="lbl_name1" runat="server"></asp:Label>
                        </td>
                        <td width="120px" class="nm">
                            <strong>Job Number:</strong>
                        </td>
                        <td>
                            <asp:Label ID="lbl_jobno1" runat="server"></asp:Label>
                        </td>
                        <td width="120px" class="nm">
                            <strong>Phone Number:</strong>
                        </td>
                        <td>
                            <asp:Label ID="lbl_phone1" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <%--<tr>
                        <td width="120px">
                            <strong>Address</strong>
                        </td>
                        <td>
                            <%--45 Castle Rock Acree, East
                            <br />
                            Slrou ds burg, Fa-18301
                        </td>
                    </tr>--%>
                </table>
            </div>
            <%-- <div class="left-section" style="margin-right: 40px;">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        
                    </tr> <tr></tr>
                </table>
            </div><div class="left-section">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="120px">
                            <strong>Completed Date</strong>
                        </td>
                        <td>
                            45-58-9246
                        </td>
                    </tr>
                    <tr>
                        <td width="120px">
                            <strong>Submited Date</strong>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div><div class="left-section">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <strong>Warm</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <strong>WarmPlus</strong>
                        </td>
                    </tr>
                </table>
            </div>--%>
            <%  
                uniqueCols = dt_ShowDemoInvoice.DefaultView.ToTable(true, "catId");
                for (int i = 0; i < uniqueCols.Rows.Count; i++)
                {
                    CatId = Convert.ToInt32(uniqueCols.Rows[i]["catId"]);
                    dt_1 = abc();%>
            <div class="line">
            </div>
            <h3 style="width: 100%; float: left;">
                <%=dt_1.Rows[0]["Category"]%>
            </h3>
            <div class="line" style="margin-top: 0; margin-bottom: 15px; background: Blue;">
            </div>
            <table cellpadding="5" cellspacing="0" class="full-left">
                <tr>
                    <td width="50px">
                        <strong>Code</strong>
                    </td>
                    <td width="1200px">
                        <strong>Measure Description</strong>
                    </td>
                    <td width="80px">
                        <strong>S/C</strong>
                    </td>
                    <td width="80px">
                        <strong>Unit</strong>
                    </td>
                    <td width="80px">
                        <strong>Labor</strong>
                    </td>
                    <td width="80px">
                        <strong>THW</strong>
                    </td>
                    <td width="80px">
                        <strong>TMC</strong>
                    </td>
                    <td width="80px">
                        <strong>Cost</strong>
                    </td>
                    <td width="80px">
                        <strong>QTY</strong>
                    </td>
                    <td width="80px">
                        <strong>Total</strong>
                    </td>
                </tr>
                <%for (int j = 0; j < dt_1.Rows.Count; j++)
                  {
                      if (Convert.ToString(dt_1.Rows[j]["Fnl_Total"]) != "")
                      {
                          FinalTotal = Convert.ToDecimal(string.Format("{0:C}", dt_1.Rows[j]["Fnl_Total"]));
                      }
                %>
                <tr>
                    <td width="50px">
                        <%if (dt_1.Rows[j]["LiurpCode"].ToString() == "")
                          {%>
                        -
                        <%}
                          else
                          {%>
                        <%=dt_1.Rows[j]["LiurpCode"]%>
                        <%}%>
                    </td>
                    <td width="1200px">
                        <%if (dt_1.Rows[j]["SubCategory"].ToString() == "")
                          {%>
                        -
                        <%}
                          else
                          {%>
                        <%=dt_1.Rows[j]["SubCategory"]%>
                        <%}%>
                    </td>
                    <td width="80px">
                        <%if (dt_1.Rows[j]["SC"].ToString() == "")
                          {%>
                        -
                        <%}
                          else
                          {%>
                        <%=dt_1.Rows[j]["SC"]%>
                        <%}%>
                    </td>
                    <td width="80px">
                        <%if (dt_1.Rows[j]["Unit"].ToString() == "")
                          {%>
                        -
                        <%}
                          else
                          {%>
                        <%=dt_1.Rows[j]["Unit"]%>
                        <%}%>
                    </td>
                    <td width="80px">
                        <%if (dt_1.Rows[j]["LaborRate"].ToString() == "")
                          {%>
                        $0.00
                        <%}
                          else
                          {%>
                        $<%=dt_1.Rows[j]["LaborRate"]%>
                        <%}%>
                    </td>
                    <td width="80px">
                        <%if (dt_1.Rows[j]["THW"].ToString() == "")
                          {%>
                        -
                        <%}
                          else
                          {%>
                        <%=dt_1.Rows[j]["THW"]%>
                        <%}%>
                    </td>
                    <td width="80px">
                        <%if (dt_1.Rows[j]["TMC"].ToString() == "")
                          {%>
                        -
                        <%}
                          else
                          {%>
                        $<%=dt_1.Rows[j]["TMC"]%>
                        <%}%>
                    </td>
                    <td width="80px">
                        <%if (dt_1.Rows[j]["CostPerUnit"].ToString() == "")
                          {%>
                        -
                        <%}
                          else
                          {%>
                        $<%=dt_1.Rows[j]["CostPerUnit"]%>
                        <%}%>
                    </td>
                    <td width="80px">
                        <%if (dt_1.Rows[j]["QTY"].ToString() == "")
                          {%>
                        -
                        <%}
                          else
                          {%>
                        <%=dt_1.Rows[j]["QTY"]%>
                        <%}%>
                    </td>
                    <td width="80px">
                        <%if (dt_1.Rows[j]["Total"].ToString() == "")
                          {%>
                        $0.00
                        <%}
                          else
                          {%>
                        $<%=dt_1.Rows[j]["Total"]%>
                        <%}%>
                    </td>
                </tr>
                <%  } %>
                <%--  <tr>
                        <td width="50px">
                            1
                        </td>
                        <td width="300px">
                            Item is dummy Content part there
                        </td>
                        <td width="300px">
                            Measure Description summy Part
                        </td>
                        <td width="100px">
                            Location
                        </td>
                        <td width="80px">
                            $545
                        </td>
                        <td width="80px">
                            5
                        </td>
                        <td width="80px">
                            low cost
                        </td>
                        <td width="80px">
                            QTY 01
                        </td>
                        <td width="80px">
                            563
                        </td>
                    </tr>
                    <tr>
                        <td width="50px">
                            1
                        </td>
                        <td width="300px">
                            Item is dummy Content part there
                        </td>
                        <td width="300px">
                            Measure Description summy Part
                        </td>
                        <td width="100px">
                            Location
                        </td>
                        <td width="80px">
                            $545
                        </td>
                        <td width="80px">
                            5
                        </td>
                        <td width="80px">
                            low cost
                        </td>
                        <td width="80px">
                            QTY 01
                        </td>
                        <td width="80px">
                            563
                        </td>
                    </tr>
                    <tr>
                        <td width="50px">
                            1
                        </td>
                        <td width="300px">
                            Item is dummy Content part there
                        </td>
                        <td width="300px">
                            Measure Description summy Part
                        </td>
                        <td width="100px">
                            Location
                        </td>
                        <td width="80px">
                            $545
                        </td>
                        <td width="80px">
                            5
                        </td>
                        <td width="80px">
                            low cost
                        </td>
                        <td width="80px">
                            QTY 01
                        </td>
                        <td width="80px">
                            563
                        </td>
                    </tr>--%>
            </table>
            <%       }
            %>
            <div class="line" style="margin-top: 0; margin-bottom: 15px;">
            </div>
            <strong style="float: right;">Invoice Total :&nbsp;&nbsp;&nbsp;
                <%= string.Format("{0:C}", FinalTotal)%></strong>
            <div class="line" style="margin-top: 0; margin-bottom: 15px;">
            </div>
        </div>
        <%-- --%>
    </div>
    </div>
    <%--tanveer pop up--%>
    <asp:Panel ID="pnl_maker" runat="server" BackColor="#E6E6ED" Width="378px" Style="display: none;
        border: 1px solid #B4B2B2; padding-left: 15px;">
        <h4 style="text-align: center; margin: 10px 0 0;">
            Select Submitted Date
        </h4>
        <table width="98%" align="Center" cellspacing="4" cellpadding="4">
            <tr>
                <td colspan="2" style="text-align: center;">
                </td>
            </tr>
            <tr>
                <td style="padding-left: 50px;">
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" class="top_btn" Style="margin: 0;"
                        OnClick="btn_submit_Click" />
                </td>
                <td>
                    <asp:Button ID="btn_Cancel" runat="server" Text="Close" class="top_btn" OnClick="btn_Cancel_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Button ID="btnShowPopup" runat="server" Style="display: none" OnClick="btnShowPopup_Click1" />
    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnl_maker"
        TargetControlID="btnShowPopup" BackgroundCssClass="modalBackground" X="520" Y="200">
    </asp:ModalPopupExtender>
    <%-- end--%>

    <script language="JavaScript" type="text/javascript">


        //----------------------------------------

        function CalculateLineEditLaborRate() {
            var Min_ = document.getElementById('<%=hdn_txt_MinLaborRate.ClientID %>').value;
            var Max_ = document.getElementById('<%=hdn_txt_MaxLaborRate.ClientID %>').value;
            var len_ = document.getElementById('<%=txtEditLabor.ClientID %>').value;
            var len_1 = len_.length; var Min_1 = Min_.length; var Max_1 = Max_.length;
            if (document.getElementById('<%=txtEditLabor.ClientID %>').value == '') {
                alert('Labor Rate can only be ' + Min_ + ' or ' + Max_ + '.');
            }
            else if (document.getElementById('<%=txtEditLabor.ClientID %>').value == Min_ + '/' + Max_) {
                alert('Labor Rate can only be ' + Min_ + ' or ' + Max_ + '.');
            }
            else if (len_1 == Min_1 || len_1 == Max_1) {
                if (document.getElementById('<%=txtEditLabor.ClientID %>').value != Min_ && document.getElementById('<%=txtEditLabor.ClientID %>').value != Max_) {
                    alert('Labor Rate can only be ' + Min_ + ' or ' + Max_ + '.');
                    document.getElementById('<%=txtEditLabor.ClientID %>').value = '';
                }
            }
            else if (len_1 <= Min_1 || len_1 <= Max_1 || len_1 > Min_1 || len_1 > Max_1) {
                var resMi = Min_.substring(0, len_1);
                var resMa = Max_.substring(0, len_1);
                if (len_ == resMi || len_ == resMa) {
                }
                else {
                    alert('Labor Rate can only be ' + Min_ + ' or ' + Max_ + '.');
                    document.getElementById('<%=txtEditLabor.ClientID %>').value = '';
                }
            }
        }



        function CalculateLineLaborRate() {
            var Min_ = document.getElementById('<%=hdn_txt_MinLaborRate.ClientID %>').value;
            var Max_ = document.getElementById('<%=hdn_txt_MaxLaborRate.ClientID %>').value;
            var len_ = document.getElementById('<%=txt_LaborRate.ClientID %>').value;
            var len_1 = len_.length; var Min_1 = Min_.length; var Max_1 = Max_.length;
            if (document.getElementById('<%=txt_LaborRate.ClientID %>').value == '') {
                alert('Labor Rate can only be ' + Min_ + ' or ' + Max_ + '.');
            }
            else if (document.getElementById('<%=txt_LaborRate.ClientID %>').value == Min_ + '/' + Max_) {
                alert('Labor Rate can only be ' + Min_ + ' or ' + Max_ + '.');
            }
            else if (len_1 == Min_1 || len_1 == Max_1) {
                if (document.getElementById('<%=txt_LaborRate.ClientID %>').value != Min_ && document.getElementById('<%=txt_LaborRate.ClientID %>').value != Max_) {
                    alert('Labor Rate can only be ' + Min_ + ' or ' + Max_ + '.');
                    document.getElementById('<%=txt_LaborRate.ClientID %>').value = '';
                }
                else {
                    CalculateLine();
                }
            }
            else if (len_1 <= Min_1 || len_1 <= Max_1 || len_1 > Min_1 || len_1 > Max_1) {
                var resMi = Min_.substring(0, len_1);
                var resMa = Max_.substring(0, len_1);
                if (len_ == resMi || len_ == resMa) {
                }
                else {
                    alert('Labor Rate can only be ' + Min_ + ' or ' + Max_ + '.');
                    document.getElementById('<%=txt_LaborRate.ClientID %>').value = '';
                }
            }
        }

        function CalculateLineTHW() {
            var THW = document.getElementById('<%=txt_THW.ClientID %>').value;
            if (THW == '.')
            { } else {
                if (isNaN(THW)) {
                    alert('Only numbers in this column. ');
                    document.getElementById('<%=txt_THW.ClientID %>').value = '';
                }
                else {
                    document.getElementById('<%=txt_THW.ClientID %>').value = THW;
                }
            }
            CalculateLine();
        }


        function CalculateLineTMC() {
            var TMC = document.getElementById('<%=txt_TMC.ClientID %>').value;
            if (TMC == '.')
            { } else {
                if (isNaN(TMC)) {
                    alert('Only numbers in this column. ');
                    document.getElementById('<%=txt_TMC.ClientID %>').value = '';
                }
                else {
                    document.getElementById('<%=txt_TMC.ClientID %>').value = TMC;
                }
            }
            CalculateLine();
        }




        function CalculateLineSC() {
            var SC = document.getElementById('<%=txt_SC.ClientID %>').value;
            if (SC != '') {
                if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_SC.ClientID %>').value = '';
                }
                else {
                    document.getElementById('<%=txt_SC.ClientID %>').value = SC;
                }
            }
            else {
                alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                document.getElementById('<%=txt_SC.ClientID %>').value = '';
            }
        }


        function CalculateLineCode() {
            if (document.getElementById('<%=txt_Liurp.ClientID %>').value == '') {
                document.getElementById('<%=txt_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Total.ClientID %>').value = '';
            }
            else {
                var THW = document.getElementById('<%=txt_THW.ClientID %>').value;
                if (isNaN(THW) || document.getElementById('<%=txt_THW.ClientID %>').value == '') {
                    THW = 0;
                }
                var TMC = document.getElementById('<%=txt_TMC.ClientID %>').value;
                if (isNaN(TMC) || document.getElementById('<%=txt_THW.ClientID %>').value == '') {
                    TMC = 0;
                }
                var Qty = document.getElementById('<%=txt_Qty.ClientID %>').value;
                if (isNaN(Qty) || document.getElementById('<%=txt_THW.ClientID %>').value == '') {
                    Qty = 0;
                }
                var Rate = document.getElementById('<%=txt_LaborRate.ClientID %>').value;
                if (isNaN(Rate) || document.getElementById('<%=txt_LaborRate.ClientID %>').value == '') {
                    Total = 0;
                }

                var Cal1 = parseFloat(THW) * parseFloat(Rate);
                var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                document.getElementById('<%=txt_THW.ClientID %>').value = THW;
                document.getElementById('<%=txt_TMC.ClientID %>').value = TMC;
                document.getElementById('<%=txt_Qty.ClientID %>').value = Qty;

                var Line17_Total = document.getElementById('<%=txt_Total.ClientID %>');
                Line17_Total.value = parseFloat(Qty * CostUnit);
                Line17_Total.value = "$" + Line17_Total.value;
                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line17_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;
                }
            }
        }

        function CalculateLine() {
            //For Multiply the Values and assign it to Total Coulmn
            var Min = document.getElementById('<%=hdn_txt_MinLaborRate.ClientID %>').value;
            var Max = document.getElementById('<%=hdn_txt_MaxLaborRate.ClientID %>').value;
            var RdoBtn = document.getElementById('<%= rdo_Standard.ClientID %>');
            if (document.getElementById('<%=txt_Liurp.ClientID %>').value == '' && RdoBtn.checked == false) {
                alert('Please select LIURP Code first.');
                document.getElementById('<%=txt_Qty.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=txt_LaborRate.ClientID %>').value == '' && RdoBtn.checked == false) {
                    alert('Labor Rate can only be ' + Min + ' or ' + Max + '.');
                    document.getElementById('<%=txt_Qty.ClientID %>').value = '';
                }
                else if (document.getElementById('<%=txt_LaborRate.ClientID %>').value == Min + '/' + Max && RdoBtn.checked == false) {
                    alert('Labor Rate can only be ' + Min + ' or ' + Max + '.');
                    document.getElementById('<%=txt_Qty.ClientID %>').value = '';
                }
                else if (document.getElementById('<%=txt_LaborRate.ClientID %>').value != Min && RdoBtn.checked == false && document.getElementById('<%=txt_LaborRate.ClientID %>').value != Max) {
                    alert('Labor Rate can only be ' + Min + ' or ' + Max + '.');
                    document.getElementById('<%=txt_Qty.ClientID %>').value = '';
                }
                else {
                    var Qty = document.getElementById('<%=txt_Qty.ClientID %>').value;
                    var THW = document.getElementById('<%=txt_THW.ClientID %>').value;
                    var TMC = document.getElementById('<%=txt_TMC.ClientID %>').value;
                    var Rate = document.getElementById('<%=txt_LaborRate.ClientID %>').value;

                    if (isNaN(THW)) {
                        THW = 0;
                    }

                    if (isNaN(TMC)) {
                        TMC = 0;
                    }

                    if (isNaN(Rate)) {
                        Rate = 0;
                    }
                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    if (isNaN(Qty)) {
                        Qty = 0;
                        alert('Please enter valid quantity');
                        document.getElementById('<%=txt_Qty.ClientID %>').value = '';
                    }
                    var Line17_Total = document.getElementById('<%=txt_Total.ClientID %>');
                    Line17_Total.value = parseFloat(Qty * CostUnit);
                    var num = parseFloat(Line17_Total.value);
                    num = num.toFixed(2);
                    Line17_Total.value = num;
                    Line17_Total.value = "$" + Line17_Total.value;
                    document.getElementById('<%=txt_Total.ClientID %>').value = Line17_Total.value;
                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line17_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line17_Total.innerHTML);
                        num = num.toFixed(2);
                        Line17_Total.innerHTML = num;
                        Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;
                        document.getElementById('<%=txt_Total.ClientID %>').value = Line17_Total.innerHTML;
                    }
                }
            }
        }


        //----------------------------------------




        function Test(rad) {
            var rads = document.getElementsByName(rad.name);
            if (rads[1].checked == false) {
                document.getElementById('<%= courier.ClientID %>').style.display = 'none';
                document.getElementById('<%= txt_MEASURE_DESCRIPTION.ClientID %>').style.display = 'none';
                document.getElementById('<%= DDl_MEASURE_DESCRIPTION.ClientID %>').style.display = 'block';
            }
            else {
                document.getElementById('<%= courier.ClientID %>').style.display = 'block';
                document.getElementById('<%= txt_MEASURE_DESCRIPTION.ClientID %>').style.display = 'block';
                document.getElementById('<%= DDl_MEASURE_DESCRIPTION.ClientID %>').style.display = 'none';
            }
        }
    </script>

    </form>
</body>
</html>
