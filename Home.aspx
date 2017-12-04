<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" EnableEventValidation="false"
    CodeFile="Home.aspx.cs" Inherits="Home" Title="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="css/jquery-ui.css" />

  <%--  <script type="text/javascript" language="javascript" src="js/jquery-1.10.2.js"></script>--%>

    <script type="text/javascript" language="javascript" src="js/jquery-ui.js"></script>

    <style type="text/css">
         .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding: 10px;
           
            width: auto;
            height: auto;
        }
        .hiddencolumn
        {
            display: none;
        }
        
        #btm_box1_
        {
            left:518px !important;
        }
        .AutoCompleteMy {
            position: relative;
            overflow: scroll;
            height: 100px;
            font: normal .8em Verdana, Helvetica, sans-serif;
            border: solid 1px #006699;
            line-height: 20px;
            text-align: left; /* max-width: 1000px; */
            min-width: 340px;
            padding: 10px;
            background-color: #fff; /*display: inline-block;  white-space: pre-wrap; white-space:normal;*/
            margin: 0px;
            position: absolute;
            top: 237px;
            z-index: 1;
        }

        .ui-widget-content {
            background: #d0eaff;
        }

        .ui-dialog .ui-dialog-content {
            background: #fff;
        }

        .ui-dialog .ui-dialog-titlebar {
            background: #d0eaff;
        }
       .textbox77 {
    border: 1px solid #ccc;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #717171;
    border-radius: 5px;
    padding: 8px;
    width: 30px;
    margin: 10px 0 5px 0;
}
    </style>

    <script>
        $(function () {
            $("#dialog").dialog({
                autoOpen: false,
                minWidth: 1080,
                show: {
                    effect: "blind",
                    duration: 1000
                },
                hide: {
                    effect: "explode",
                    duration: 1000
                }
            });

            $("#btnpopup").click(function openPopup() {
                $("#dialog").dialog("open");
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <%--<script type="text/javascript">

        function openPopup()
        {
         window.open("Calendar.aspx", "_blank", "WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no");
        }
    </script>--%>
    <div class="homecalendar">
        <a class="cd-popup-trigger" href="javascript:void(0);">
            <%--id="btnpopup"--%>
            <img src="CalendarEvent/images.jpg" alt="Calender" style="width: 45px; height: 45px;" />
        </a>
        <%--<asp:ImageButton ID="btnpopup" runat="server" ImageUrl="~/CalendarEvent/images.jpg"
            Width="50px" OnClientClick="return openPopup()"  />--%><%--OnClientClick="return openPopup()"--%>
    </div>
    <%--<div id="dialog" title="Event Calender">--%>
    <div class="cd-popup" role="alert">
        <div class="cd-popup-container">
            <iframe src="Calendar.aspx" frameborder="0" width="1020px" height="760px"></iframe>
            <a href="#0" class="cd-popup-close img-replace"></a>
        </div>
    </div>
    <div class="mid_boxes">
        <div class="mid_box1">
            <h1>Messaging System</h1>
            <p>
                Types of Messages include Unread, Read, and Sent. Click on the button to the left
                to display all types.
                <br />
                The number of unread messages, if any, is displayed to the left.
                <br />
                You may use the system to send messages (<strong>and add notes to jobs</strong>)
                to single or multiple employees.
            </p>
           
            <div class="message">
                <a href="JobMessages.aspx"></a><span class="msg_count">
                    <asp:Label ID="lblCountMsg" runat="server"></asp:Label>
                </span>
            </div>
        </div>
        <div id="mid_box2" runat="server" class="mid_box2">
            <h1>Add a New Job</h1>
            <p>
                To Add a new Job enter the job number into the text box below and then click the
                &quot;New&quot; button. If the Job Number does not exist you will then enter all
                required data to insert a new job. If the Job Number does exist a message appears
                warning you that this is a duplicate Job Number and is not allowed.
            </p>
            <div align="center">
                <asp:TextBox ID="txtJobNew" runat="server" MaxLength="25" Width="170px" onkeyup="txtboxDisable(this.id)"
                    placeholder="Add New Job"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                    TargetControlID="txtJobNew" FilterType="Custom,Numbers,LowercaseLetters,UppercaseLetters"
                    InvalidChars=" " FilterMode="InvalidChars">
                </ajaxToolkit:FilteredTextBoxExtender>
                <asp:TextBox ID="txtVendorJobNew" runat="server" MaxLength="30" Width="170px" onkeyup="txtboxDisable(this.id)"
                    Placeholder="Add New Vendor"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                    TargetControlID="txtVendorJobNew" FilterType="Custom,Numbers,LowercaseLetters,UppercaseLetters"
                    InvalidChars=" " FilterMode="InvalidChars">
                </ajaxToolkit:FilteredTextBoxExtender>
           
                <br />
                <asp:Button ID="btnNewJob" runat="server" Text="New" ValidationGroup="NewSubmit"
                    class="btn_all" OnClick="btnNewJob_Click" />
                <br />
                <asp:Label ID="lblMsgNewJob" runat="server"></asp:Label>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <!-- end mid section1 -->
    <div class="clear">
    </div>
    <!-- mid section2 -->
    <div class="bottmo_secbg" id="div_bottmo_secbg" runat="server">
        <div id="btm_box1_" runat="server" class="btm_box1" >
            <asp:Panel ID="PanelAdvanceSearch" runat="server" DefaultButton="btnFind">
                <div class="divalign">
                    <br />
                    <h1>Find A Job<a id="lnkAdvanceSearch" runat="server" href="AdvancedSearchByDate.aspx">
                            Advance Search </a>
                    </h1>
                 
                    <asp:TextBox ID="txtJobNumber" runat="server" Placeholder="Job Number"></asp:TextBox>
                  
                    <br />
                    <asp:TextBox ID="txtLastName" runat="server" Placeholder="Last Name"></asp:TextBox>
               
                    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtLastName"
                        ServiceMethod="FunShowLastName" CompletionListCssClass="AutoCompleteMy" MinimumPrefixLength="1"
                        ServicePath="~/SearchName.asmx" CompletionInterval="0">
                    </ajaxToolkit:AutoCompleteExtender>
                   
                    <span class="smalltxt">Type any part of last name</span><br />
                    <asp:TextBox ID="txtAccount" runat="server" Placeholder="Account"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtPhone" runat="server" Placeholder="Phone"></asp:TextBox>
                   <br />
                    <span class="smalltxt">Example: 570-555-1212</span><br />
                  
                    <asp:Button ID="btnFind" runat="server" Text="Find" OnClick="btnFind_Click" class="btn_all" />
                </div>
            </asp:Panel>
        </div>
        <div id="btm_box2" runat="server" class="btm_box2">
            <div class="divalignm">
                <h2>
                    <i>Jobs Status</i></h2>
             
                <div class="alljobs_btn">
                    <asp:LinkButton ID="lnk_job" runat="server" OnClick="lnk_job_Click">All Jobs</asp:LinkButton>
                     
             
                    <span class="count">
                        <%=AllJob%></span>
                </div>
                <h2>
                    <i>Vendors Status</i></h2>
                <div class="alljobs_btn">
                    <asp:LinkButton ID="lnk_vendorJob" runat="server" OnClick="lnk_vendorJob_Click">All Vendors</asp:LinkButton>
                   
                    <span class="count">
                        <%=AllvendorJob%></span>
                </div>
            </div>
        </div>
        <div id="btm_box1" runat="server" class="btm_box1">
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFindVendor">
                <div class="divalign">
                    <br />
                    <h1>Find A Vendor
                    </h1>
                   
                    <asp:TextBox ID="txtVendorNum" runat="server" Placeholder="Vendor Name"></asp:TextBox>
                
                    <br />
                    <asp:TextBox ID="txtVendorName" runat="server" Placeholder="Contact Name"></asp:TextBox>
                   
                    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" TargetControlID="txtVendorName"
                        ServiceMethod="FunShowFirstName" CompletionListCssClass="AutoCompleteMy" MinimumPrefixLength="1"
                        ServicePath="~/SearchName.asmx" CompletionInterval="0">
                    </ajaxToolkit:AutoCompleteExtender>
                  
                    <span class="smalltxt">Type any part of Vendor Name</span><br />
                    <asp:TextBox ID="txtVendorAccount" runat="server" Placeholder="Account"></asp:TextBox>
                  <br />
                    <asp:TextBox ID="txtVendorPhone" runat="server" Placeholder="Phone"></asp:TextBox>
                  <br />
                    <span class="smalltxt">Example: 570-555-1212</span><br />
                    <%--<input name="" type="button" value="Find" />--%>
                    <asp:Button ID="btnFindVendor" runat="server" Text="Find" class="btn_all" OnClick="btnFindVendor_Click" />
                </div>
            </asp:Panel>
        </div>
        <div class="clear">
        </div>
    </div>
    <div id="DivAssignJob" runat="server" style="width: 48%; margin-bottom: 25px; display: inline-block; text-align: center; font-style: italic;">
        <h1 class="assign">Assigned Jobs</h1>
        <div class="togglebtndiv">
            <a href="javascript:void(0);" class="togglebtn">
                <img src="images/toggle_btn.png" alt="ToggleBtn_Minus" class="open" />
                <img src="images/toggle_btn_plus.png" alt="ToggleBtn_Plus" class="close" /></a>
        </div>
        <div class="rounded_corners toggletbl">
            <asp:GridView ID="grdAssignJob" runat="server" EmptyDataText="No Record !!" Width="100%"
                OnRowDataBound="grdAssignJob_RowDataBound" AutoGenerateColumns="false" DataKeyNames="JobNumber"
                HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A" OnRowUpdating="grdAssignJob_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Job Number">
                        <ItemTemplate>
                            <asp:Label ID="LblFinal" Visible="false" runat="server" Text='<%#Eval("Final")%>'></asp:Label>
                            <asp:LinkButton ID="lnkBtnJobNumber" runat="server" Text='<%#Eval("JobNumber")%>'
                                CommandName="Update"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Client Name">
                        <ItemTemplate>
                            <%#Eval("ClientName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Assign Date">
                        <ItemTemplate>
                            <asp:Label ID="LblDate" runat="server" Text='<%#Eval("AssignDate", "{0:MM/dd/yyyy}")%>'></asp:Label>
                            <asp:Label ID="LblDash" runat="server" Text="-" Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Job Amount">
                        <ItemTemplate>
                            $
                            <%#Eval("JobAmount", "{0:0.00}")%>
                           
                            <asp:Image ID="ImgRject" runat="server" Visible="false" ImageUrl="images/architetto_FEVICON.png"
                                Style="float: right;" />
                                
                                <asp:Panel ID="pnlDemo" CssClass="modalPopup" runat="server">
                        <asp:Label ID="lblCommentText" runat="server" TextMode="MultiLine"></asp:Label>
                    </asp:Panel>
                    
                    <ajaxToolkit:HoverMenuExtender ID="ImgRjectHVR" runat="server" PopupControlID="pnlDemo" TargetControlID="ImgRject">
                    </ajaxToolkit:HoverMenuExtender>
                  
                    
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        

        <script type="text/javascript">
            $(document).ready(function () {
                $(".togglebtn").click(function () {
                    $(".toggletbl").toggle("slidedown");
                    $(this).children('img').each(function () {
                        $(this).toggle(0);
                    });
                });
            });
        </script>

    </div>
    <div class="iconright" id="Diviconright" runat="server" style="display: none;">
        <h1 class="assign">Pay Records</h1>
        <a href="PaidUnPaidInvoice.aspx?UsrName=<%=StrUserName %>" class="payrecords">
            <img src="images/iconright.png" alt="Go" style="height: 52px; margin: 26px 0 0 3px;" /></a>
    </div>
    
            
            
            
            
            

    <script type="text/javascript">
               
               
        function ClearText(ID) {
            var text = document.getElementById(ID).value;
            document.getElementById('<%= txtJobNumber.ClientID %>').value = 'Job Number';
            document.getElementById('<%= txtLastName.ClientID %>').value = 'Last Name';
            document.getElementById('<%= txtAccount.ClientID %>').value = 'Account';
            document.getElementById('<%= txtPhone.ClientID %>').value = 'Phone';
            document.getElementById(ID).value = text;
        }

        function txtboxDisable(ID) {
            if (document.getElementById('<%= txtVendorJobNew.ClientID %>').value == '' && document.getElementById('<%= txtJobNew.ClientID %>').value == '') {
                document.getElementById('<%= txtVendorJobNew.ClientID %>').disabled = false;
                document.getElementById('<%= txtJobNew.ClientID %>').disabled = false;
            }
            else {
                //Server ke liye ct100 hta do
                if (ID == 'ct100_ContentPlaceHolder1_txtVendorJobNew' && document.getElementById(ID).value != '') {
                    document.getElementById('<%= txtJobNew.ClientID %>').disabled = true;
            }//Server ke liye ct100 hta do
            else if (ID == 'ct100_ContentPlaceHolder1_txtJobNew' && document.getElementById(ID).value != '') {
                document.getElementById('<%= txtVendorJobNew.ClientID %>').disabled = true;
            }
    }
}

jQuery(document).ready(function ($) {
    //open popup
    $('.cd-popup-trigger').on('click', function (event) {
        event.preventDefault();
        $('.cd-popup').addClass('is-visible');
    });

    //close popup
    $('.cd-popup').on('click', function (event) {
        if ($(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    });
    //close popup when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            $('.cd-popup').removeClass('is-visible');
        }
    });
});
    </script>

</asp:Content>
