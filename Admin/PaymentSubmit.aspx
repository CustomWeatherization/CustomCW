<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="PaymentSubmit.aspx.cs" Inherits="Admin_PaymentSubmit" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <%-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>--%>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
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
        .paidBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
        }
        .paidBtnDis
        {
            background: #A1DCF2;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
        }
        .PayBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
            float: right; /*margin-right: -175px;*/
            margin-top: 30px;
        }
        .RejectBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            padding: 5px 20px;
            border-bottom-left-radius: 5px;
            cursor: pointer;
            margin-top: 30px;
        }
        .JobBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            padding: 5px 20px;
            border-bottom-left-radius: 5px;
            cursor: pointer;
            margin-top: 30px;
            float: left;
        }
    </style>

    <script type="text/javascript">
        function paymentAlert() {
            alert("Selected Items were Paid");
        }
    </script>

    <script type="text/javascript">
        
        function paymentRjtAlert() {
            alert("Selected Items were Reject");
            document.getElementById('<%=P1.ClientID%>').style.display = 'none';
            document.getElementById('<%=PnlAlert.ClientID%>').style.display = 'block';           
        }

                        
    </script>

  
  <%--<script src="Scripts/bootstrap-multiselect.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap-2.3.2.min.js" type="text/javascript"></script>
    <link href="Styles/bootstrap-3.1.1.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />--%>
    <%--<script type="text/javascript">
        $(function () {
            $('[id*=lstColumns]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>--%>
<%--<script type="text/javascript" src="Js/jquery-1.2.2.pack.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <table align="center">
        <tr>
            <td>
                <strong>Employee:-</strong>&nbsp;<asp:DropDownList ID="DDL_Employee" runat="server"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: black; border-radius: 5px; padding: 8px; margin: 0; width: 200px;" maxlength="40"
                    AutoPostBack="true" OnSelectedIndexChanged="DDL_Employee_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
           <%-- <td>
            <strong>Select Columns:-</strong>&nbsp;
          <asp:ListBox ID="lstColumns" runat="server" SelectionMode="Multiple"  >
             <%-- <asp:ListItem Text="Messege" Value="1"></asp:ListItem>
             <asp:ListItem Text="Client Name" Value="3"></asp:ListItem>             
             <asp:ListItem Text="Job Number" Value="4"></asp:ListItem>--%>
            <%-- <asp:ListItem Text="Submitted By" Value="4"></asp:ListItem>
              <asp:ListItem Text="Submitted Date" Value="5"></asp:ListItem>
              <asp:ListItem Text="Date approved for payment" Value="7"></asp:ListItem>
              <asp:ListItem Text="EditDate" Value="8"></asp:ListItem>
               <asp:ListItem Text="Submitted For" Value="9"></asp:ListItem>
               <asp:ListItem Text="Inv No" Value="10"></asp:ListItem>
               <asp:ListItem Text="Job Amount" Value="11"></asp:ListItem>
                <asp:ListItem Text="Percentage" Value="12"></asp:ListItem>
                 <asp:ListItem Text="Inspection Audit" Value="13"></asp:ListItem>
                  <asp:ListItem Text="PPl Audit" Value="14"></asp:ListItem>
                  <asp:ListItem Text="METED Audit" Value="15"></asp:ListItem>
                  <asp:ListItem Text="Extra Measures" Value="16"></asp:ListItem>--%>
                <%--  <asp:ListItem Text="Total Amount Owed" Value="18"></asp:ListItem>
                  <asp:ListItem Text="Invoice/Audit" Value="19"></asp:ListItem>--%>
           <%-- </asp:ListBox>
            </td>
            <td>
            <asp:Button ID="btnColumns" Text="Select Columns" runat="server" OnClick="btnColumns_click" />
            </td>--%>
        </tr>
    </table>
    <br />
    <div style="float: right;">
        <strong>Page Size:&nbsp;</strong>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="15" Value="15"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
            <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <asp:UpdatePanel ID="upPnl" runat="server">
        <ContentTemplate>
            <%--<asp:Button ID="btnRejectRP" runat="server" Text="Reject" OnClick="btnRejectRP_Click" />--%>
            <asp:Button ID="btnNotPay" runat="server" Text="Not Paid" CssClass="paidBtn" OnClick="btnNotPay_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnPay" runat="server" Text="Paid" CssClass="paidBtnDis" OnClick="btnPay_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="BtnRejected" runat="server" Text="Rejected" CssClass="paidBtnDis"
                OnClick="BtnRejected_Click" />
            <div class="rounded_corners" style="width: 100%; overflow: auto; max-height: 435px;">
                <asp:GridView ID="grdSubmitPayment" runat="server" Width="1100px" DataKeyNames="Submit_Id"
                    EmptyDataText="No Record !!" AutoGenerateColumns="false" PageSize="10" AllowPaging="true"
                    OnRowDeleting="grdSubmitPayment_RowDeleting" AllowSorting="true" OnPageIndexChanging="grdSubmitPayment_PageIndexChanging"
                    HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                    AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A" OnRowDataBound="grdSubmitPayment_RowDataBound"
                    OnSorting="grdSubmitPayment_Sorting" OnDataBound="grdSubmitPayment_DataBound1"
                    OnRowCommand="grdSubmitPayment_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Messege">
                            <ItemTemplate>
                                <asp:Image ID="ImgRject" runat="server" Visible="false" ImageUrl="images/architetto_FEVICON.png"
                                    Style="float: right;" />
                                <asp:Panel ID="pnlDemo" CssClass="modalPopup" runat="server">
                                    <asp:Label ID="lblCommentText" runat="server" TextMode="MultiLine"></asp:Label>
                                </asp:Panel>
                                <ajaxToolkit:HoverMenuExtender ID="ImgRjectHVR" runat="server" PopupControlID="pnlDemo"
                                    TargetControlID="ImgRject">
                                </ajaxToolkit:HoverMenuExtender>
                            </ItemTemplate>
                            <HeaderStyle Width="3%" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbSelectAll" runat="server" Text="Select All" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkRow" runat="server" onClick="JobRejectBtn(this.id)" ValidationGroup='<%#Eval("Submit_Id")%>' />
                            </ItemTemplate>
                            <HeaderStyle Width="1%" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Client Name">
                            <ItemTemplate>
                                <%#Eval("ClientName")%>
                            </ItemTemplate>
                            <HeaderStyle Width="8%" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Job Number">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_D_JobNum" runat="server" Text='<%#Eval("JobNumber")%>' Visible="false"
                                    CommandName="Update"></asp:LinkButton>
                                <asp:Label ID="lbl_D_JobNum" runat="server" Text='<%#Eval("JobNumber")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="6%" />
                         
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Submitted By" SortExpression="SubmittedBy"  >
                        
                            <ItemTemplate>
                           
                                <asp:Label ID="lbl_D_Submitted" runat="server" Text='<%#Eval("SubmittedBy")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="7%" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Submitted Date" >
                         
                            <ItemTemplate>
                           
                                <asp:Label ID="lbl_D_SD" runat="server" Text='<%#Eval("DateSubmitted","{0:d}") %>'></asp:Label>
                                <asp:Label ID="LBL_SD_Blank" runat="server" Text="-"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="8%" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Date approved for payment" Visible="false">
                       
                            <ItemTemplate >
                                <asp:Label ID="lbl_D_DAP" runat="server" Text='<%#Eval("DateApprovePayment","{0:d}") %>'></asp:Label>
                                <asp:Label ID="LBL_DAP_Blank" runat="server" Text="-"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="8%" />
                        </asp:TemplateField> 
                        
                        
                        <asp:TemplateField HeaderText="EditDate" >
                         <HeaderTemplate> <asp:ImageButton  ID="imgEditDateMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgClickEditDateMinus" /><br /><br /> EditDate<%--<asp:Label runat="server" Text="Edit Date" style="text-align:center"></asp:Label>--%></HeaderTemplate><%--onclick="showHideColumn(5);--%>
                            <ItemTemplate>
                                <asp:Label ID="lbl_D_ROD" runat="server" Text='<%#Eval("ReOpenDate","{0:d}") %>'></asp:Label>
                                <asp:Label ID="LBL_ROD_Blank" runat="server" Text="-"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="8%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="Edit Date" ID="imgEditDatePlus" runat="server" style="margin-bottom:30px"  ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgClickEditDatePlus"  /></HeaderTemplate>
                             <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="Submitted For" >
                         <HeaderTemplate><asp:ImageButton ID="imgSubmittedForMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgClickSubmittedForMinus" /> <br />Submitted For</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_G_Audit" runat="server" Text="Audit" Visible="false"></asp:Label>
                                <asp:Label ID="lbl_G_Invoice" runat="server" Text="Invoice" Visible="false"></asp:Label>
                                <asp:Label ID="lbl_G_Inspection" runat="server" Text="Inspection" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="5%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="Submitted For" ID="imgSubmittedForPlus" runat="server" style="margin-bottom:30px"  ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgClickSubmittedForPlus"  /></HeaderTemplate>
                        <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="Inv No" >
                        <HeaderTemplate><asp:ImageButton ID="imgInvNoMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgClickInvNoMinus" /><br />Inv No</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_InvoiceNO" runat="server" Text='<%# ((int)Eval("InvNo") < 1) ? "-" : Eval("InvNo") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="3%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="Inv No" ID="imgInvNoPlus" runat="server" style="margin-bottom:30px"  ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgClickInvNoPlus"  /></HeaderTemplate>
                               <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="Job Amount" >
                        <HeaderTemplate><asp:ImageButton ID="imgJobAmountMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgClickJobAmountMinus"  /><br />Job Amount</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_D_InvoiceAmt" runat="server" Text="$"></asp:Label><asp:Label ID="lbl_G_InvoiceAmt"
                                    runat="server" Text='<%#Eval("InvoiceAmt")%>'></asp:Label>
                                <asp:Label ID="lbl_G_Blank1" runat="server" Text="-" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="6%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="Job Amount"  ID="imgJobAmountPlus" runat="server" style="margin-bottom:30px"  ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgClickJobAmountPlus"  /></HeaderTemplate>
                          <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="Percentage" >
                        <HeaderTemplate><asp:ImageButton ID="imgPercentageMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgClickPercentageMinus"  /><br /><br />Percentage</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_G_Percentage" runat="server" Text='<%#Eval("PersentRate")%>'></asp:Label><asp:Label
                                    ID="lbl_D_Percentage" runat="server" Text="%"></asp:Label>
                                <asp:Label ID="lbl_G_Blank2" runat="server" Text="-" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="6%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="Percentage" ID="imgPercentagePlus" runat="server" style="margin-bottom:30px"  ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgClickPercentagePlus"  /></HeaderTemplate>
                         <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="Inspection Audit" >
                        <HeaderTemplate><asp:ImageButton ID="imgInspectionAuditMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgClickInspectionAuditMinus"  /><br />Inspection Audit</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_D_InspectionRate" runat="server" Text="$"></asp:Label>
                                <asp:Label ID="lbl_G_InspectionRate" runat="server" Text='<%# Eval("InspectionRate")%>'></asp:Label>
                                <asp:Label ID="lbl_G_BlankInspection" runat="server" Text="-" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="6%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="Inspection Audit" ID="imgInspectionAuditPlus" runat="server" style="margin-bottom:30px"  ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgClickInspectionAuditPlus"  /></HeaderTemplate>
                          <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="PPl Audit" >
                        <HeaderTemplate><asp:ImageButton ID="imgPPLAuditMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgCliclPPLAuditMinus"  /><br />PPl Audit</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_D_AuditRate" runat="server" Text="$"></asp:Label><asp:Label ID="lbl_G_AuditRate"
                                    runat="server" Text='<%# Eval("AuditRate")%>'></asp:Label>
                                <asp:Label ID="lbl_G_Blank3" runat="server" Text="-" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="4%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="PPl Audit" ID="imgPPLAuditPlus" runat="server" style="margin-bottom:30px"  ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgCliclPPLAuditPlus"  /></HeaderTemplate>
                         <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="METED Audit" >
                        <HeaderTemplate><asp:ImageButton ID="imgMetedMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgCickMetedMinus"  /><br />METED Audit</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_D_MetedRate" runat="server" Text="$"></asp:Label><asp:Label ID="lbl_G_MetedRate"
                                    runat="server" Text='<%# Eval("MetedAuditRate")%>'></asp:Label>
                                <asp:Label ID="lbl_G_BlankMetedRate" runat="server" Text="-" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="7%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="METED Audit" ID="imgMetedPlus" runat="server"  style="margin-bottom:30px"  ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgCickMetedPlus"  /></HeaderTemplate>
                         <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="Extra Measures" >
                        <HeaderTemplate><asp:ImageButton ID="imgExtraMeasureMinus" runat="server"   ImageUrl="images/minus7.png"  Width="15px" Height="15px" OnClick="imgclickExtraMeasureMinus"  /><br />Extra Measures</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_E_Measures" runat="server" Text="$"></asp:Label><asp:Label ID="lbl_G_ExtraMeasures"
                                    runat="server" Text='<%#Eval("ExtraMesr") %>'></asp:Label>
                                <asp:Label ID="lbl_G_Blank5" runat="server" Text="-" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="7%" />
                        </asp:TemplateField>
                        
                         <asp:TemplateField Visible="false">                   
                            <ItemTemplate>
                              </ItemTemplate>
                                <HeaderTemplate><asp:ImageButton title="Extra Measures" ID="imgExtraMeasurePlus" runat="server"   ImageUrl="images/plus7.png"  Width="15px" Height="15px" OnClick="imgclickExtraMeasurePlus" style="margin-bottom:30px" /></HeaderTemplate>
                          <HeaderStyle Width="2%" />
                         </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="Total Amount Owed">
                            <ItemTemplate>
                                <asp:Label ID="lbl_D_GrandTotal" runat="server" Text="$"></asp:Label>
                                <asp:Label ID="lbl_G_GrandTotal" runat="server" Text='<%# addGrandTotal(Eval("TotalAmount"))%>'></asp:Label>
                                <asp:Label ID="lbl_G_Blank4" runat="server" Text="-" Visible="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="9%" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Invoice/Audit">
                            <ItemTemplate>
                                <div class="top_icons">
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="lnkReject" runat="server" Style="color: Blue;" Text="Reject"
                                                CommandName="Delete" OnClientClick="showDiv();"></asp:LinkButton>
                                            <%--OnClientClick="return confirm('Are you sure you want to Re-Open this Job?');"--%>
                                        </li>
                                        <li>
                                            <%--<asp:LinkButton ValidationGroup='<%#Eval("InvNo") %>' CommandArgument='<%#Eval("utility") %>'
                                                ID="Insp" runat="server" Visible="false" class="audit"></asp:LinkButton>--%>
                                            <asp:LinkButton ValidationGroup='<%#Eval("InvNo") %>' CommandArgument='<%#Eval("utility") %>'
                                                ID="Audi" runat="server" Visible="false" class="audit"></asp:LinkButton>
                                            <asp:LinkButton ValidationGroup='<%#Eval("InvNo") %>' CommandArgument='<%#Eval("utility") %>'
                                                ID="Inv" runat="server" Visible="false" class="billing"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </ItemTemplate>
                            <HeaderStyle Width="3%" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="RejectedDate">
                            <ItemTemplate>
                                <asp:Label ID="lbl_RejectedDate" runat="server" Text='<%#Eval("RejectedDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="4%" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <br />
            <div id="DivGrndTotal" runat="server" style="float: right; margin-right: 45px;">
                Grand Total:-&nbsp;<b>
                    <asp:Label ID="lbl_GrandTotal" runat="server"></asp:Label></b>
            </div>
            <div style="clear: both;">
                <asp:Button ID="btn_reject" runat="server" Text="Job Reject" CssClass="JobBtn" Style="display: none"
                    OnClientClick="showDiv();" /><%--OnClick="btn_reject_Click"--%>
                <asp:Button ID="btn_Paid" Style="display: none" runat="server" Text="Pay Selected"
                    CssClass="PayBtn" OnClientClick="paymentAlert();" OnClick="btn_Paid_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="P1" runat="server" Style="display: none">
        <%--DefaultButton="btn_Update"--%>
        <table id="Table3" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup cover-bg"
            width="225px" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.33); padding-left: 4px; z-index: 9999; padding-left: 4px;
            display: none">
            <tr>
                <td>
                    <table id="Table4" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup"
                        style="padding-left: 4px; position: absolute; left: 35%; background: #fff; border: 2px solid #000;
                        top: 25%; height: 40%; width: 24%;">
                        <tr>
                            <td align="center">
                                <br />
                                <asp:Label ID="lbl_HdnId" Style="color: white;" runat="server"></asp:Label>
                                <br />
                                <b>Add Note for why you reject this job</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txt_Comment" runat="server" TextMode="MultiLine" Rows="12" Style="border: 2px solid #ccc;
                                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                                    padding: 8px; margin: 0; width: 313px;"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="rfv_txt_Comment" runat="server" Style="margin-left: 33%;"
                                    ValidationGroup="rfvrjct" ErrorMessage="Add Comment Please" ControlToValidate="txt_Comment"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:UpdatePanel ID="UpPnlAlert" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btn_rejectBtn" runat="server" ValidationGroup="rfvrjct" Text="Job Reject"
                                            CssClass="RejectBtn" Style="margin-top: 1px;" OnClientClick="paymentRjtAlert();" /><%--OnClick="btn_reject_Click"--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:Button ID="btn_RjctCancel" runat="server" Text="Cancel" OnClick="btn_RjctCancel_Click"
                                    CssClass="RejectBtn" Style="margin-top: 1px;" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    
    
    <asp:Panel ID="PnlAlert" runat="server" Style="display: none">
        <%--DefaultButton="btn_Update"--%>
        <table id="TblAlert" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup cover-bg"
            width="225px" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.33); padding-left: 4px; z-index: 9999; padding-left: 4px;">
            <tr>
                <td>
                    <table id="TblAlert_" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup"
                        style="padding-left: 4px; position: absolute; left: 35%; background: #fff; border: 2px solid #000;
                        top: 25%; height: auto; width: 26%; min-height: 150px; padding: 20px; border-radius: 5px;">
                        <tr>
                            <td>
                                Are you sure you want to delete this from “Receive Payment” list?
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="Button1" runat="server" ValidationGroup="rfvrjct" Text="Ok" CssClass="RejectBtn"
                                    Style="margin-top: 1px; width: 24%;" OnClick="btnRejectRP_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="btn_reject_Click"
                                    CssClass="RejectBtn" Style="margin-top: 1px;" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <script type="text/javascript">
//    function showHideColumn(a){
//    debugger;
//     var grid = document.getElementById("<%= grdSubmitPayment.ClientID %>");
//  //   var obj = {};
//       
//        $.ajax({
//            type: "POST",
//            url: "PaymentSubmit.aspx/showHideColumns",
//            data: JSON.stringify(a),
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            success: function (r) {
//                alert(r.d);
//            }
//        });
//      }
  
        function showDiv() {
        debugger;
            document.getElementById('<%=P1.ClientID%>').style.display = 'block';
            document.getElementById('<%=Table3.ClientID%>').style.display = 'block';
        }

        function JobRejectBtn(ID) {
            var chk = document.getElementById(ID);
            var grid = document.getElementById("<%= grdSubmitPayment.ClientID %>");
            var cell;
            var count = 0;
            if (chk.checked == true) {
                if (grid.rows.length > 0) {
                    for (i = 1; i < grid.rows.length; i++) {
                        for (var k = 0; k < grid.rows[i].cells.length; k++) {
                            cell = grid.rows[i].cells[k];
                            for (j = 0; j < cell.childNodes.length; j++) {
                                if (cell.childNodes[j].type == "checkbox") {
                                    if (cell.childNodes[j].checked == true) {
                                        count++;
                                    }
                                    if (count > 0 && count < 2) {
                                        document.getElementById('<%=btn_reject.ClientID%>').style.display = 'block';
                                        document.getElementById('<%=btn_Paid.ClientID%>').style.display = 'block';
                                    }
                                    else if (count > 1) {
                                        document.getElementById('<%=btn_reject.ClientID%>').style.display = 'none';
                                    document.getElementById('<%=btn_Paid.ClientID%>').style.display = 'block';
                                }
                        }
                    }
                }
            }
        }
        chk.checked = true;
    }
    else if (chk.checked == false) {
        if (grid.rows.length > 0) {
            for (i = 1; i < grid.rows.length; i++) {
                for (var k = 0; k < grid.rows[i].cells.length; k++) {
                    cell = grid.rows[i].cells[k];
                    for (j = 0; j < cell.childNodes.length; j++) {
                        if (cell.childNodes[j].type == "checkbox") {
                            if (cell.childNodes[j].checked == true) {
                                count++;
                            }
                            if (count == 1) {
                                document.getElementById('<%=btn_reject.ClientID%>').style.display = 'block';
                                document.getElementById('<%=btn_Paid.ClientID%>').style.display = 'block';
                            }
                            else if (count == 0) {
                                document.getElementById('<%=btn_reject.ClientID%>').style.display = 'none';
                                    document.getElementById('<%=btn_Paid.ClientID%>').style.display = 'none';
                                }
                                else if (count > 1) {
                                    document.getElementById('<%=btn_reject.ClientID%>').style.display = 'none';
                                    document.getElementById('<%=btn_Paid.ClientID%>').style.display = 'block';
                                }
                    }
                }
            }
        }
    }
}
}

    </script>

    <script type="text/javascript"> 
    
    
     
function SelectAll(id)   
{  
    var grid = document.getElementById("<%=grdSubmitPayment.ClientID %>");  
    var cell;  
    var count=0;
    if (grid.rows.length > 0)   
    {  
        for (i = 1; i < grid.rows.length-1; i++)   
        {  
        cell = grid.rows[i].cells[0];  
            for (j = 0; j < cell.childNodes.length; j++)   
            {  
                if (cell.childNodes[j].type == "checkbox")   
                {  
                 count=count+1;
                    cell.childNodes[j].checked = document.getElementById(id).checked;  
                }  
            }
            
                                    
        } 
        debugger;
        if (count ==1)
           {
           document.getElementById("<%=btn_Paid.ClientID %>").style.display = 'block';
           document.getElementById("<%=btn_reject.ClientID %>").style.display = 'block';
           }
        else if (count > 1)
        {
        document.getElementById("<%=btn_reject.ClientID %>").style.display = 'none';
        document.getElementById("<%=btn_Paid.ClientID %>").style.display = 'block';
        }   
       
    }  
}  
    </script>

</asp:Content>
