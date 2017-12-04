using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// EventDAO class is the main class which interacts with the database. SQL Server express edition
/// has been used.
/// the event information is stored in a table named 'event' in the database.
///
/// Here is the table format:
/// event(event_id int, title varchar(100), description varchar(200),event_start datetime, event_end datetime)
/// event_id is the primary key
/// </summary>
public class EventDAO

  {
    private static string connectionString = ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString();

    public static List<CalendarEvent> getEvents(DateTime start, DateTime end)
    {
        List<CalendarEvent> events = new List<CalendarEvent>();
        SqlConnection con = new SqlConnection(connectionString);

        SqlCommand cmd = new SqlCommand("Select *  from CalendarEvent1", con);
      //  cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = start;
        using (con)
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
               
                string h = Convert.ToString(reader["allday"]);
                CalendarEvent cevent = new CalendarEvent();
                cevent.id = (int)reader["Id"];
                cevent.Name = (string)reader["Name"];
                cevent.Address = (string)reader["ServiceAddress"];
                cevent.Phone = Convert.ToString(reader["Phone"]);
                cevent.AuditorName = Convert.ToString(reader["AuditorName"]);
                cevent.CrewCheifName = Convert.ToString(reader["CrewCheifName"]);
                cevent.description = (string)reader["ServiceAddress"];
                //if (reader["event_start"] != DBNull.Value)
                //{
                //cevent.start = (DateTime)reader["event_start"];
                //}
                //else
                //{
                //    cevent.start = Convert.ToDateTime("");
                //}
                //cevent.end = (DateTime)reader["event_end"];
                ////if((reader["phone"]) == "")
                ////{
                //    cevent.phone = "";
                //}
                //else
                //{
                //    cevent.phone= (string)reader["phone"];
                //}
                //if ((string)reader["auditorname"] != "select")
                //{
                //    cevent.auditorname = (string)reader["auditorname"];
                //}
                //else
                //{ cevent.auditorname = "-"; }
                //if ((string)reader["crewcheifname"] != "select")
                //{
                //    cevent.crewcheifname = (string)reader["crewcheifname"];
                //}
                //else
                //{ cevent.crewcheifname = "-"; }

                //cevent.jobtype_ = convert.tostring(reader["jobtype"]);
                //cevent.start = (datetime)reader["contactresult"];
                ////if (reader["allday"] != dbnull.value)
                ////{
                //    cevent.allday = convert.toboolean(reader["allday"]);
                //  cevent.status = convert.toboolean(reader["status"]);
                //  }
                ////if (reader["status"] != dbnull.value)
                ////{
                ////    cevent.status = convert.toboolean(reader["status"]);
                ////}
                ////else
                ////{
                ////    cevent.status = true;
                ////}
                cevent.allDay = Convert.ToBoolean(reader["allday"]);
                if (reader["Timeslot"] != DBNull.Value)
                {
                    cevent.time = (string)reader["Timeslot"];
                }
                else
                { cevent.time = "-"; }

                if (reader["contact"] != DBNull.Value)
                {
                    cevent.contactResult = (string)reader["contact"];
                }
                else
                { cevent.contactResult = "-"; }

                if (reader["Eventcolor"] != DBNull.Value)
                {
                    cevent.Eventcolor = (string)reader["Eventcolor"];

                }
                else
                {
                    cevent.Eventcolor = "#3a87ad";
                }

                events.Add(cevent);
            }
        }
        return events;

    }
  
    public static void updateEvent(int id, String title, String description)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("UPDATE CalendarEvent1 SET Name=@Name, ServiceAddress=@ServiceAddress WHERE Id=@Id", con);
        cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = title;
        cmd.Parameters.Add("@ServiceAddress", SqlDbType.VarChar).Value = description;
        cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;

        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
            //con.Close();

        }
    }

    //this method updates the event start and end time ... allDay parameter added for FullCalendar 2.x
    public static void updateEventTime(int id, DateTime start, DateTime end, bool allDay)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("UPDATE CalendarEvent1 SET event_start=@event_start, event_end=@event_end, allDay=@allDay WHERE Id=@Id", con);
        cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = start;
        cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = end;
        cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@allDay", SqlDbType.Bit).Value = allDay;

        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    ////this mehtod deletes event with the id passed in.
    public static void deleteEvent(int id)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("DELETE FROM CalendarEvent1 WHERE (Id = @Id)", con);
        cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;

        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    ////this method adds events to the database
    public static int addEvent(CalendarEvent cevent)
    {
        //add event to the database and return the primary key of the added event row

        //insert
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("INSERT INTO  CalendarEvent1 (Name, ServiceAddress, event_start, event_end, allDay,Status,ContactResult,Phone) VALUES(@Name, @ServiceAddress, @event_start, @event_end, @allDay,@Status,@ContactResult,@Phone)", con);
        cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = cevent.title;
        cmd.Parameters.Add("@ServiceAddress", SqlDbType.VarChar).Value = cevent.description;
        cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = cevent.start;
        cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = cevent.end;
        cmd.Parameters.Add("@allDay", SqlDbType.Bit).Value = cevent.allDay;
        cmd.Parameters.Add("@Status", SqlDbType.Bit).Value = false;
        cmd.Parameters.Add("@ContactResult", SqlDbType.DateTime).Value = cevent.start;
        cmd.Parameters.Add("@Phone", SqlDbType.VarChar).Value = "0";
        int key = 0;
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();


            //get primary key of inserted row
            cmd = new SqlCommand("SELECT max(Id) FROM  CalendarEvent1", con);
            //cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = cevent.title;
            //cmd.Parameters.Add("@ServiceAddress", SqlDbType.VarChar).Value = cevent.description;
            //cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = cevent.start;
            //cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = cevent.end;
            //cmd.Parameters.Add("@allDay", SqlDbType.Bit).Value = cevent.allDay;
            //cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = cevent.Name;
            key = (int)cmd.ExecuteScalar();


        }

        return key;

    }

}

