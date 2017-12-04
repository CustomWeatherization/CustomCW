﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Calendar" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CalendarEvent/css/cupertino/jquery-ui-1.10.3.min.css" rel="stylesheet" type="text/css" />
    <link href="CalendarEvent/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="CalendarEvent/css/jquery.qtip-2.2.0.css" rel="stylesheet" type="text/css" />

    <script src="CalendarEvent/jquery/moment-2.8.1.min.js" type="text/javascript"></script>
    <script src="CalendarEvent/jquery/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="CalendarEvent/jquery/jquery-ui-1.11.1.js" type="text/javascript"></script>
    <script src="CalendarEvent/jquery/jquery.qtip-2.2.0.js" type="text/javascript"></script>
    <script src="CalendarEvent/fullcalendar/fullcalendar-2.0.3.js" type="text/javascript"></script>
    <script src="CalendarEvent/scripts/calendarscript.js" type="text/javascript"></script>
    <%--<script src="jquery/jquery-ui-timepicker-addon-1.4.5.js" type="text/javascript"></script>--%>

    <style type='text/css'>
        body
        {
            margin-top: 40px;
            text-align: center;
            font-size: 14px;
            font-family: "Lucida Grande" ,Helvetica,Arial,Verdana,sans-serif;
        }
        #calendar
        {
            width: 900px;
            margin: 0 auto;
        }
        /* css for timepicker */
        .ui-timepicker-div dl
        {
            text-align: left;
        }
        .ui-timepicker-div dl dt
        {
            height: 25px;
        }
        .ui-timepicker-div dl dd
        {
            margin: -25px 0 10px 65px;
        }
        .style1
        {
            width: 100%;
        }
        
        /* table fields alignment*/
        .alignRight
        {
        	text-align:right;
        	padding-right:10px;
        	padding-bottom:10px;
        }
        .alignLeft
        {
        	text-align:left;
        	padding-bottom:10px;
        }
    </style>
</head>
    <body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div id="calendar">
    </div>
  <div id="updatedialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 50px;display: none;"
        title="Update or Delete Event">
        <table class="style1">
            <tr>
                <td class="alignRight">
                    Name:</td>
                <td class="alignLeft">
                    <input id="eventName" type="text" /><br /></td>
            </tr>
            <tr>
                <td class="alignRight">
                    Description:</td>
                <td class="alignLeft">
                    <textarea id="eventDesc" cols="30" rows="3" ></textarea></td>
            </tr>
            <tr>
                <td class="alignRight">
                    Start:</td>
                <td class="alignLeft">
                    <span id="eventStart"></span></td>
            </tr>
            <tr>
                <td class="alignRight">
                    End: </td>
                <td class="alignLeft">
                    <span id="eventEnd"></span><input type="hidden" id="eventId" /></td>
            </tr>
        </table>
    </div>
   <div id="addDialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 50px;" title="Add Event">
    <table cellpadding="0" class="style1">
            <tr>
                <td class="alignRight">
                    Name:</td>
                <td class="alignLeft">
                    <input id="addEventName" type="text" size="50" /><br /></td>
            </tr>
            <tr>
                <td class="alignRight">
                    Description:</td>
                <td class="alignLeft">
                    <textarea id="addEventDesc" cols="30" rows="3" ></textarea></td>
            </tr>
            
          <%--  <tr>
                <td class="alignRight">
                    End date</td>
                <td class="alignLeft">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="CalendarExtender1" TargetControlID="TextBox2">
                    </cc1:CalendarExtender>
                </td>
                
            </tr>--%>
           
<%--            <tr>
                <td class="alignRight">
                    End date</td>
                <td class="alignLeft">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1">
                    </cc1:CalendarExtender>
                </td>
                
            </tr>--%>
           
           
        </table>
        
    </div>
  
    <div runat="server" id="jsonDiv" />
    <input type="hidden" id="hdClient" runat="server" />
    </form>
</body></html>
