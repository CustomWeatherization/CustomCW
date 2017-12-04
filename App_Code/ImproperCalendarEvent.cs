using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Do not use this object, it is used just as a go between between javascript and asp.net
public class ImproperCalendarEvent
{
    public int id { get; set; }
    public string Name { get; set; }
    public string Address { get; set; }
    public string Phone { get; set; }
    public string AuditorName { get; set; }
    public string CrewCheifName { get; set; }
    public string JobType_ { get; set; }
    public string title { get; set; }
    public string start { get; set; }
    public string time { get; set; }
    public string Eventcolor { get; set; }
    public string contactResult { get; set; }
    public string end { get; set; }
    public bool allDay { get; set; }
    public string description { get; set; }
    public bool Status { get; set; }
}
