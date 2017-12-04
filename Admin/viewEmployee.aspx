<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true" CodeFile="viewEmployee.aspx.cs" Inherits="Admin_viewEmployee" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" language="javascript" src="../js/jquery-1.10.2.js"></script>

    <script type="text/javascript" language="javascript" src="../js/jquery-ui.js"></script>
    <style type="text/css">
          .leaves-tbl {border: 1px solid #A1DCF2;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
    overflow: hidden;}
.leaves-tbl tr th{ padding:15px 10px;  border: 1px solid #A1DCF2;  font-family: Arial; font-size: 10pt;  text-align: center;  font-style: normal;}
.leaves-tbl tr td{ padding:15px 10px;    border: 1px solid #A1DCF2;  font-family: Arial;  font-size: 10pt;  text-align: center;    font-style: normal;}
.leaves-tbl select{  width:100%; border-radius: 10px; padding: 8px;}
.table tr td input, textarea, textbox, select{ padding:5px 5px; border-radius:5px;}
         .Background
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .Popup
        {  padding:20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            overflow:auto;
            padding-left: 10px;
            width: 800px;
            height: 850px;
            border-radius:10px;
        }
        .Popup1
        {  padding:20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
           
            padding-left: 10px;
            width: 1150px;
            height: 500px;
            border-radius:10px;
        }
         .Popup2
        {  padding:20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
           
            padding-left: 10px;
            width: 1000px;
            height: 500px;
            border-radius:10px;
        }
         .text_style
        {
        
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
            color: #000;
          width:245px;
            padding: 8px;
            margin: 0px;
        }
        .back_color
        {
            width: 845px;
            float: left;
            background-color: #D0EAFF;
            border-radius: 5px;
            margin: 0px 10px;
            padding: 15px 30px;
        }
        .inputfile {
	width: 0.1px;
	height: 0.1px;
	opacity: 0;
	overflow: hidden;
	position: absolute;
	z-index: -1;
}
.fileUpload {
    position: relative;
    overflow: hidden;
    margin: 10px;
}
        .top_btn 
        {
        width:225px;    
        }
       
       .section h3{float:left; margin-right:5px !important;} 
   .job-title-section select{width: 59%; padding: 8px 5px;}  
   .select-manager-section select{ width: 100%; padding: 8px 5px;}   
  table input, textarea, textbox, select{ border-radius:5px;}
 table tr td .btn-submit{ margin-right:20px;}
  #ctl00_ContentPlaceHolder1_pnlTimeTypeDetails{ background-color:rgba(0, 0, 0, 0.08);}
   #ctl00_ContentPlaceHolder1_pnlTypeOfTimeView{ background-color:rgba(0, 0, 0, 0.08);}
  table tr td .h3-section{ float:left; margin-right:3px; }
   table tr td #ctl00_ContentPlaceHolder1_lblPersonalSalary { margin-right:20px;}
   .news{display:none}
    </style>
    <link href="Styles/jqColor.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
 
   
    <div class="section">
        <div class="">
             <h1> <asp:Label ID="lblFirstName" runat="server" ></asp:Label>&nbsp;<asp:Label ID="lblLastName" runat="server"></asp:Label></h1>
              <asp:Panel runat="server" ID="pnlView">
     <asp:UpdatePanel ID="UpPnl" runat="server">
                <ContentTemplate>
                    <asp:CheckBox ID="Chk_SetAuditor" runat="server" AutoPostBack="true" OnCheckedChanged="Chk_SetAuditor_CheckedChanged" />Is
                    this User an Auditor?
           <br />
            <table width="100%" border="0" cellspacing="10" cellpadding="5" >              
                <tr>
                <td >
                <asp:Image ID="imgProfileImage" ImageUrl="" runat="server" Height="100px" Width="100px"/>
                </td>
                <td>
                  <b> <i>Job Title</i></b><br />
                <asp:Label ID="lblDesignation" Text="Administrator" runat="server" ForeColor="Blue" CssClass="text_style"></asp:Label>
                </td>
                 <td width="5%" style="padding: 15px;">
                    </td>
                </tr>
                 <tr>
                    <td width="15%">
                       <b> <i> Date Of Birth: </i></b>
                    </td>
                    <td width="30%">
              
                     <asp:Label ID="lblBirthdate" runat="server" Text="Not Available" CssClass="text_style"></asp:Label>
                    </td>
                     <td width="5%" style="padding: 15px;">
                    </td>
                    </tr>
                    
                       <tr>
                    <td width="20%" >
                        <b> <i> Start Date:   </i></b>
                    </td>
                    <td width="30%">
              
                     <asp:Label ID="lblJoiningDate" runat="server" Text="Not Available" CssClass="text_style"></asp:Label>
                    </td>
                     <td width="5%" style="padding: 15px;">
                    </td>
                    </tr>
                    
                <tr>
                    <td width="20%">
                        <b> <i> Phone:  </i></b>
                    </td>
                    <td width="30%">
                     <asp:Label ID="lblPhoneNumber" runat="server" Text="Not Available" CssClass="text_style"></asp:Label>
                    </td>
                     <td width="5%" style="padding: 15px;">
                    </td>
                    </tr>
                <tr>
                    <td width="20%">
                       <b> <i>  Address:  </i></b>
                    </td>
                    <td width="30%" style="height: 20px;">
                    
                      <asp:Label ID="lblAddress" runat="server" CssClass="text_style"></asp:Label><br />
                      <asp:Label ID="lblCity" runat="server" CssClass="text_style"></asp:Label>&nbsp;<asp:Label ID="lblState" runat="server"></asp:Label><br />
                      <asp:Label ID="lblPincode" runat="server" CssClass="text_style"></asp:Label>
                      
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                  
                </tr> 
               
               
                <tr>
                    <td width="20%">
                       <b> <i>  Email:  </i></b>
                    </td>
                    <td width="30%">
                   <asp:Label ID="lblEmail" runat="server" Text="Not Available" CssClass="text_style"></asp:Label>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
              
                </tr>
                
                 <tr>
                    <td width="20%">
                      <b> <i>   Personal Salary:  </i></b>
                    </td>
                    <td width="30%">
                   <asp:Label ID="lblSalary" runat="server" Text="Not Available" CssClass="text_style"></asp:Label>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
              
                </tr>
                  <tr>
                    <td width="20%">
                     
                    </td>
                    <td width="30%">
                  <asp:Button ID="btn_cancel" Text="Cancel" runat="server" OnClick="btn_cancel_Click"
                    CssClass="BtnPrintHistory" />
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
              
                </tr>
                
                 <tr>
                    
                   <td colspan="3" >
                      <h3 class="h3-section"><b><i> <asp:Label ID="lblTotalHours" runat="server" Text="" ForeColor="Blue"></asp:Label></i> </b></h3>
            <asp:ImageButton ID="imgShowView" runat="server" ImageUrl="images/minus7.png" OnClick="ShowUserTimeDetails_Click1" Height="15px" Width="15px" />
                     <asp:ImageButton ID="imgHideView" runat="server" ImageUrl="images/plus7.png" OnClick="HideUserTimeDetails_Click1" Visible="false" Height="15px" Width="15px" Title="Show Time Off Details"/>
                  
                   </td>
                </tr>
           
            </table>
            
            
            <asp:Panel ID="pnlTypeOfTimeView" runat="server">
            <table width="100%" border="0" cellspacing="10px" >
            <tr>
            <td>
           <h3>Time Off</h3> 
            </td>
            </tr>
            <tr>
            <th>
            Type of Time Off
            </th>
             <th>
           Since Joining
            </th>
             <th>
           This Year
            </th>
            
          </tr>
       <tr>
           <td>
               Emergency Paid Time Off</td>
           <td>
               <asp:Label ID="lblEmergencyPaidTimeOffSinceJoin" runat="server" Text="0 Hr."></asp:Label>
           </td>
           <td>
               <asp:Label ID="lblEmergencyPaidTimeOffThisYear" runat="server" Text="0 Hr."></asp:Label>
           </td>
           <tr>
          <td>Emergency Time Off</td>
          <td><asp:Label ID="lblEmergencyTimeOffSinceJoin" runat="server" Text="0 Hr."></asp:Label></td>
          <td><asp:Label ID="lblEmergencyTimeOffThisYear" runat="server" Text="0 Hr."></asp:Label></td>
          </tr>
            <tr>
          <td>Holiday Pay</td>
          <td><asp:Label ID="lblHolidayPaySinceJoin" runat="server" Text="0 Hr."></asp:Label></td>
          <td><asp:Label ID="lblHolidayPayThisYear" runat="server" Text="0 Hr."></asp:Label></td>
          </tr>
      
             <tr>
            <td>Sickness</td>
            <td><asp:label id="lblsicknesssincejoinnig" runat="server" text="0 Hr."></asp:label></td>
            <td><asp:label id="lblsicknessthisyear" runat="server" text="0 Hr."></asp:label></td>
            
            </tr>
             <tr>
            <td>Unpaid Leave</td>
            <td><asp:label id="lblunpaidsincejoining" runat="server" text="0 Hr."></asp:label></td>
            <td><asp:label id="lblunpaidthisyear" runat="server" text="0 Hr."></asp:label></td>
            
            </tr>
               <tr>
            <td>Vacation</td>
            <td><asp:label id="lblholidaysincejoining" runat="server" text="0 Hr."></asp:label></td>
            <td><asp:label id="lblholidaythisyear" runat="server" text="0 Hr."></asp:label></td>
            
            </tr>
            
               <tr>
                <td>Occurrences</td>
           <%-- <td><asp:LinkButton ID="lbtnOccurences" runat="server" OnClick="lbtnOccurences_Click" Text="Occurrences"></asp:LinkButton> </td>--%>
            <td><asp:Label ID="lblOccurencesSinceJoinng" runat="server" Text="#"></asp:Label></td>
            <td><asp:Label ID="lblOccurencesThisYear" runat="server" Text="#"></asp:Label></td>
            
            </tr>
            </table>
            </asp:Panel>
             
              </ContentTemplate>
                </asp:UpdatePanel>
               </asp:Panel>
              
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>           
    <asp:Panel runat="server" ID="pnlEdit">
      
      <table width="98%"  border="0" cellspacing="2" cellpadding="2">              
                <tr>
               <td  colspan="2">
             <asp:Image ID="imgpreview" runat="server" Height="100" Width="100" />
                   <br></br>
              <asp:FileUpload ID="profileUpload" runat="server" onchange="showpreview(this);" CssClass="fileUpload"  />               
                </td>
                 <td width="5%" style="padding: 15px;">
                    </td>
              
           <%--   <td  colspan="2" width="30%" style=" padding-top:100px;">
                <span style=" margin-right:117px;">Job Title:</span>
                 
                </td>--%>
                </tr>
                 <tr>
                    <td width="20%">
                        Login Id:
                    </td>
                    <td width="25%">
              <asp:TextBox ID="txtLoginId" runat="server"  Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                     <td width="5%" style="padding: 5px;">
                    </td>
                     <td width="20%">
                        Select Manager:
                    </td>
                    <td class="select-manager-section" width="30%">
              <asp:DropDownList ID="ddlManager" runat="server" ></asp:DropDownList>
                    </td>
                    </tr>
                       <tr>
                    <td width="20%" >
                        Email:
                    </td>
                    <td width="25%">
              <asp:TextBox ID="txtEmail" runat="server" placeholder="Not Available" Width="100%" CssClass="text_style"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="expEmail" ValidationGroup="G" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="valid email address required" ValidationExpression="^([a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]){1,70}$"></asp:RegularExpressionValidator>
                    </td>
                      <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        PTO Holidays:
                    </td>
                     <td width="25%">
                     <asp:ImageButton ID="imgPtoShow" runat="server" ImageUrl="~/images/Plus.png" OnClick="btnShow_Click" />
                      <asp:ImageButton ID="imgPtoHide" runat="server" ImageUrl="~/images/Minus.png"  OnClick="btnHide_Click"  Visible="false"/>
                       <%-- <asp:TextBox ID="txtMaxxVacationHours" runat="server" Width="100%" MaxLength="5" placeholder="Not Available" CssClass="text_style" ></asp:TextBox>--%>
              </td>
                    </tr>
                   <asp:Panel ID="pnlHolidays" runat="server" Visible="false" >
                     <tr >
                      
                    <td width="20%" >
                        
                    </td>
                    <td width="25%">            </td>
                      <td width="5%" style="padding: 15px;">
                    </td>
                    <td colspan="2">                    
                        <asp:CheckBoxList ID="chkHolidaysList" runat="server" RepeatLayout="flow" RepeatColumns="3">
                        <asp:ListItem Value="NewYears" Text="NewYears"> New Year's Day&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:ListItem>
                         <asp:ListItem Value="MLK" Text="MLK"> Martin Luther King Jr.  </asp:ListItem>
                          <asp:ListItem Value="MemorialDay" Text="MemorialDay"> Memorial Day&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                           <asp:ListItem Value="IndependenceDay" Text="IndependenceDay"> Independence Day </asp:ListItem>
                            <asp:ListItem Value="LaborDay" Text="LaborDay"> Labor Day&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                             <asp:ListItem Value="Columbus" Text="Columbus"> Columbus Day&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </asp:ListItem>
                              <asp:ListItem Value="Veterans" Text="Veterans"> Veterans Day </asp:ListItem>
                               <asp:ListItem Value="Thanksgiving" Text="Thanksgiving"> Thanksgiving Day </asp:ListItem>
                                <asp:ListItem Value="Christmas" Text="Christmas"> Christmas Day </asp:ListItem>                                
                                  </asp:CheckBoxList>
                    </td>
                    
                    </tr>
                     </asp:Panel>
                <tr>
                <td width="20%">
                        Passcode:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtPasscode" runat="server" placeholder="Not Available" Width="100%" CssClass="text_style" MaxLength="10"></asp:TextBox>
                      
                    </td>
                     <td width="5%" style="padding: 15px;">
                   <td width="20%">
                        Max Vacation Hours:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtMaxxVacationHours" runat="server" Width="100%" MaxLength="5" placeholder="Not Available" CssClass="text_style" ></asp:TextBox>
              </td>
                    </tr>
             <tr>
                <td width="20%">
                     Job Title:
                    </td>
                    <td width="25%">
            <asp:TextBox ID="txtJobTitle" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
       
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                 <td width="20%" >
                        Password:
                    </td>
                    <td width="25%">
              <asp:TextBox ID="txtPassword" MaxLength="20" runat="server" placeholder="Not Available" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
               <td width="20%">
                        Personal Salary:
                    </td>
                    <td width="25%">
                      <%--  <asp:TextBox ID="txtPersonalSalary" runat="server" MaxLength="10" Width="100%" CssClass="text_style"  Enabled="false"></asp:TextBox>--%>
                      <asp:Label ID="lblPersonalSalary" runat="server" Font-Size="Small"  >&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label><asp:LinkButton ID="lnkPrsonalSalry" Font-Size="Small" runat="server" Text="Wage and/or Salary History" OnClick="lbnPayment_Click"></asp:LinkButton>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                 
                 <td width="20%">
                       Start Date:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtJoiningDate" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                         <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="txtJoiningDate">
                    </ajaxToolkit:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        BCOC Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtBCOCInvoiceRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                     <td width="20%">
                        Date Of Birth:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtBirthDate" runat="server" Width="100%" CssClass="text_style">   </asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" BehaviorID="CalendarExtender" TargetControlID="txtBirthDate">
                    </ajaxToolkit:CalendarExtender>
                         
                    </td>
                   
                </tr>
                <tr>
                    <td width="20%">
                        Private Customer Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtPCInvoiceRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                  <td width="20%">
                        DCED Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtDCEDInvoiceRate" runat="server" Width="100%" CssClass="text_style" MaxLength="10"></asp:TextBox>
                    </td>
                   
                </tr>

                <tr>
                    <td width="20%">
                        PPL Z1 & Z2 Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtZ1Z2Rate" MaxLength="10" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        UGI Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtUGIInvoiceRate" runat="server" Width="100%"  MaxLength="10" CssClass="text_style"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                 
                     <td width="20%">
                        Extra Measure:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtExtraMesr" runat="server" MaxLength="10" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        Inspection Rate</td>
                    <td width="25%">
                        <asp:TextBox ID="txtInspectionRate" MaxLength="10" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
              
                </tr>
                   <tr>
                    <td width="20%">
                      Hourly Rate:
                    </td>
                    <td width="25%">
               <asp:TextBox ID="txtHourlyRate" runat="server" MaxLength="10" placeholder="Not Available" Width="100%" CssClass="text_style" OnTextChanged="txtHourlyRateChenge_Click" AutoPostBack="true"></asp:TextBox>
                    </td>
                     <td width="5%" style="padding: 15px;">
                    </td>
                   <td width="20%">
                        PPL Audit Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_AuditRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"
                            onblur="Currency_Format(this.id);"></asp:TextBox>
                    </td>
                    </tr>
                    
                     <tr>
                        <td width="20%">
                        METED Audit Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtMetedAudit" runat="server" Width="100%" CssClass="text_style"
                            onblur="Currency_Format(this.id);"></asp:TextBox>
                    </td>
                  
                     <td width="5%" style="padding: 15px;">
                    </td>
                     <td width="20%">
                        Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_PersentRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    </tr>
                       <tr>
                      
                    <td width="20%">
                      Color Picker:
                    </td>
                    <td width="25%">
               <input id="ColorPickerId" type="text" runat="server"  class="color" onclick="return color();"  />
               <asp:HiddenField ID="hdnColorpickerID" runat="server"/>
                    </td>
                     <td width="5%" style="padding: 15px;">
                    </td>
                     <td width="20%">
                        Question:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtQuestion" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    </tr>
                    <tr>
                    <td width="20%">
                      
                    </td>
                    <td width="30%" colspan="2">
              <asp:Button ID="btn_submit" Text="Update" runat="server" ValidationGroup="G" CssClass="BtnPrintHistory btn-submit"
                   OnClick="btn_submit_Click" /><asp:Button ID="btnCancel1" Text="Cancel" runat="server" OnClick="btn_cancel_Click"
                    CssClass="BtnPrintHistory" />
                    </td>
                     <td width="5%" style="padding: 15px;">
                    </td>
                     <td width="20%">
                    </td>
                    <td width="30%">
                    </td>
                    </tr>
               <tr>
                    <td colspan="5" >
                      <h3><b><i> <asp:Label ID="lblTotalHoursEdit" runat="server"  ForeColor="Blue"></asp:Label></i> </b></h3>
                   <asp:ImageButton ID="imgShow" runat="server" ImageUrl="images/minus7.png" OnClick="ShowUserTimeDetails_Click" Height="15px" Width="15px" />
                     <asp:ImageButton ID="imgHide" runat="server" ImageUrl="images/plus7.png" OnClick="HideUserTimeDetails_Click" Visible="false" Height="15px" Width="15px" Title="Show Time Off Details"/>
                   </td>
                </tr>
           
            </table>
            
            <asp:Panel ID="pnlTimeTypeDetails" runat="server">
            <table width="100%" border="0" cellspacing="10px" >
            <tr>
            <td>
           <h3>Time Off</h3> 
            </td>
            </tr>
            <tr>
            <th>
            Type of Time Off
            </th>
             <th>
           Since Joining
            </th>
             <th>
           This Year
            </th>
            
          </tr>
              <tr>
          <td>Emergency Paid Time Off</td>
          <td><asp:Label ID="lblEmergencyPaidTimeOffSinceJoin1" runat="server" Text="0"></asp:Label></td>
          <td><asp:Label ID="lblEmergencyPaidTimeOffThisYear1" runat="server" Text="0"></asp:Label></td>
          </tr>
           <tr>
          <td>Emergency Time Off</td>
          <td><asp:Label ID="lblEmergencyTimeOffSinceJoin1" runat="server" Text="0"></asp:Label></td>
          <td><asp:Label ID="lblEmergencyTimeOffThisYear1" runat="server" Text="0"></asp:Label></td>
          </tr>
            <tr>
          <td>Holiday Pay</td>
          <td><asp:Label ID="lblHolidayPaySinceJoin1" runat="server" Text="0"></asp:Label></td>
          <td><asp:Label ID="lblHolidayPayThisYear1" runat="server" Text="0"></asp:Label></td>
          </tr>
     
             <tr>
            <td>Sickness</td>
            <td><asp:Label ID="lblSicknessSinceJoinnig1" runat="server" Text="0"></asp:Label></td>
            <td><asp:Label ID="lblSicknessThisYear1" runat="server" Text="0"></asp:Label></td>
            
            </tr>
             <tr>
            <td>Unpaid Leave</td>
            <td><asp:Label ID="lblUnpaidSinceJoining1" runat="server" Text="0"></asp:Label></td>
            <td><asp:Label ID="lblUnpaidThisYear1" runat="server" Text="0"></asp:Label></td>
            
            </tr>
               <tr>
        
            <td>Vacation</td>
            <td><asp:Label ID="lblHolidaySinceJoining1" runat="server" Text="0"></asp:Label></td>
            <td><asp:Label ID="lblHolidayThisYear1" runat="server" Text="0"></asp:Label></td>
            
            </tr>
              <tr>
              <td>Occurrences</td>
            <td><asp:Label ID="lblOccurencesSinceJoinng1" runat="server" Text="#"></asp:Label></td>
            <td><asp:Label ID="lblOccurencesThisYear1" runat="server" Text="#"></asp:Label></td>
            
            </tr>
            </table>
            </asp:Panel>
    
    </asp:Panel>
     <asp:Button ID="btnShowPopup" runat="server" Style="display: none" OnClick="btnShowPopup_Click1" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlPaymentHistory"
        TargetControlID="btnShowPopup" BackgroundCssClass="Background" X="512" Y="15">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlPaymentHistory" runat="server" CssClass="Popup1" align="center" style = "display:none">
   <div style="width:97%">
            <div style="text-align:center;     width: 100% !important;" class="divalign">
         <h1 class="assign" style=" width: 100% !important;"> <b> <asp:Label runat="server" ID="lblRequestedOff" Text="Salary History"></asp:Label></b> <asp:ImageButton ID="ImageButton1" runat="server" OnClick="btn_cancelPayment_Click" ImageUrl="images/Cross3.png" Height="35px" Width="35px" style="float: right;margin-right: 20px;"/></h1>
            </div>
              <div class="rounded_corners" style="width: 100%;overflow: auto; max-height: 450px;" id="div_grid" runat="server">
        <asp:GridView ID="grdPaymentHistory" runat="server" Width="100%" DataKeyNames="User_Id" class="leaves-tbl"
            AutoGenerateColumns="false" PageSize="10" AllowPaging="true" OnPageIndexChanging="grdPaymentHistory_PageIndexChanging"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
            AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A"  EmptyDataText="No Request Available">
            <RowStyle BackColor="#A1DCF2" ForeColor="#3A3A3A"></RowStyle>
            <Columns>
            
              <asp:TemplateField HeaderText="Previous Hourly Rate">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Login" runat="server" Text='<%#Eval("HourlyOldRate","{0:c}")%>'></asp:Label>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Current Hourly Rate">
                    <ItemTemplate>
                        <asp:Label ID="lblUserName" runat="server" Text='<%#Eval("HourlyNewRate","{0:c}")%>'></asp:Label>                       
                    </ItemTemplate>
                </asp:TemplateField>
         <asp:TemplateField HeaderText="Previous Salary">
                    <ItemTemplate>
                
                      <asp:Label ID="lblFromDate" runat="server" Text='<%#Eval("OldSalary","{0:c}")%>' ForeColor="Blue"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Current Salary">
                    <ItemTemplate>
            
                    <asp:Label ID="lblToDate" runat="server" Text='<%#Eval("NewSalary","{0:c}")%>' ForeColor="Blue"></asp:Label>
                 
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DateTime">
                    <ItemTemplate>
                     <asp:Label ID="lblFromTime" runat="server" Text='<%# Eval("Date")%>'></asp:Label>                       
                    </ItemTemplate>                    
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        </asp:GridView>
    </div>
            
            </div>
    </asp:Panel>
    
     <asp:Panel ID="pnlOccurences" runat="server"  CssClass="Popup2" style = "display:none">
    <div style="width:100%">
            <div style="text-align:center;     width: 100% !important;" class="divalign">
         <h1 class="assign" style=" width: 100% !important;"> <b> <asp:Label runat="server" ID="Label2" Text="Occurrances Details"></asp:Label></b> <asp:ImageButton ID="imgBtnCancelOccurence" runat="server" OnClick="btn_occurences_cancel_Click" ImageUrl="images/Cross3.png" Height="35px" Width="35px" style="float: right;margin-right: 20px;"/></h1>
            </div>
               <br />
    <div style="float: right;margin-right: 23px;" id="div_page" runat="server">
        <strong>Page Size:&nbsp;</strong>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
          <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="15" Value="15"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
            <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <br /><br />
                <asp:GridView ID="grdOccurences" runat="server" Width="98%" DataKeyNames="OccurrencesID" class="leaves-tbl"
            AutoGenerateColumns="false" PageSize="10" AllowPaging="true" OnPageIndexChanging="grdOccurences_PageIndexChanging"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
            AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A" EmptyDataText="No Request Available" >
            <RowStyle BackColor="#A1DCF2" ForeColor="#3A3A3A"></RowStyle>
            <Columns>
            
           
                 <asp:TemplateField HeaderText="Employee Name">
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%#Eval("EmployeeName")%>'></asp:Label>                       
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Manager Name">
                    <ItemTemplate>
                        <asp:Label ID="lblManagerName" runat="server" Text='<%#Eval("ManagerName")%>'></asp:Label>                       
                    </ItemTemplate>
                </asp:TemplateField>
         <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                
                      <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date")%>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Narrative">
                    <ItemTemplate>
            
                    <asp:Label ID="lblNarrative" runat="server" Text='<%#Eval("Narrative")%>' ></asp:Label>
                 
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                     <asp:Label ID="lblActionTaken" runat="server" Text='<%# Eval("ActionTaken")%>'></asp:Label>                       
                    </ItemTemplate>
                    
                </asp:TemplateField>
              
                <asp:TemplateField HeaderText="Response">
                    <ItemTemplate>
                       <asp:Label ID="lblResponse" runat="server" Text='<%# Eval("Response")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
              
             
             
                 
            </Columns>
            <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        </asp:GridView>
              
       
       </div>                                        
    </asp:Panel>
     <asp:Button ID="btnPanelOccurences" runat="server" Style="display: none" OnClick="btnPanelShowOccurences_Click" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender4" runat="server" PopupControlID="pnlOccurences"
        TargetControlID="btnPanelOccurences" BackgroundCssClass="Background" X="520" Y="150">
    </ajaxToolkit:ModalPopupExtender>
     </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_submit" />
                      <%--<asp:PostBackTrigger ControlID="chkHolidaysList" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
        
    </div>
   
     <script type="text/javascript" src="Scripts/colors.js"></script>
  
    <script type="text/javascript" src="Scripts/colorPicker.data.js"></script>
    <script type="text/javascript" src="Scripts/colorPicker.js"></script>
      <script type="text/javascript" src="Scripts/jqColor.js"></script>
    <%-- <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        function showpreview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                $("#<%=imgpreview.ClientID%>").css('visibility', 'visible');
                 //   $('#imgpreview').css('visibility', 'visible');
                     $("#<%=imgpreview.ClientID%>").attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }

    </script>
    
     <script type="text/javascript">
        
        
         var colorvalue = $("#<%=hdnColorpickerID.ClientID%>").value;
         var $colors = $('input.color').colorPicker({

             customBG: '#222',
             readOnly: true,
             init: function(elm, colors) { // colors is a different instance (not connected to colorPicker)

                 if (elm.value != "") {
                     elm.style.backgroundColor = elm.value;
                     colorvalue = elm.value;

                 } else {
                 elm.style.backgroundColor = "#3a87ad";
                 colorvalue = "#3a87ad";
                 }
                 elm.style.color = colors.rgbaMixCustom.luminance > 0.22 ? '#222' : '#ddd';
             }
         }).each(function(idx, elm) {
             // $(elm).css({'background-color': this.value})
         });
</script>

    <script type="text/javascript">
        function CurrencyFormat(number) {
            var decimalplaces = 2;
            var decimalcharacter = ".";
            var thousandseparater = "";
            number = parseFloat(number);
            var sign = number < 0 ? "-" : "";
            var formatted = new String(number.toFixed(decimalplaces));
            if (decimalcharacter.length && decimalcharacter != ".") { formatted = formatted.replace(/\./, decimalcharacter); }
            var integer = "";
            var fraction = "";
            var strnumber = new String(formatted);
            var dotpos = decimalcharacter.length ? strnumber.indexOf(decimalcharacter) : -1;
            if (dotpos > -1) {
                if (dotpos) { integer = strnumber.substr(0, dotpos); }
                fraction = strnumber.substr(dotpos + 1);
            }
            else { integer = strnumber; }
            if (integer) { integer = String(Math.abs(integer)); }
            while (fraction.length < decimalplaces) { fraction += "0"; }
            temparray = new Array();
            while (integer.length > 3) {
                temparray.unshift(integer.substr(-3));
                integer = integer.substr(0, integer.length - 3);
            }
            temparray.unshift(integer);
            integer = temparray.join(thousandseparater);
            if (isNaN(integer)) {
                integer = '0';
            }
            return '$ ' + sign + integer + decimalcharacter + fraction;
        }
    </script>

    <script type="text/javascript">
        function Currency_Format(ID) {
            var cost = document.getElementById(ID).value;
            cost = cost.replace('$', '');
            var amt = CurrencyFormat(cost);
            document.getElementById(ID).value = amt;
        }

        function ShowPanel() {        
            document.getElementById('<%=pnlHolidays.ClientID%>').style.display = 'block';
            document.getElementById('<%=imgPtoHide.ClientID%>').style.display = 'block';
            document.getElementById('<%=imgPtoShow.ClientID%>').style.display = 'none';           
        }
        function HidePanel() {          
            document.getElementById('<%=pnlHolidays.ClientID%>').style.display = 'none';
            document.getElementById('<%=imgPtoHide.ClientID%>').style.display = 'none';
            document.getElementById('<%=imgPtoShow.ClientID%>').style.display = 'block';          
        }
    </script>
   
</asp:Content>
