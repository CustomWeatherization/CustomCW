using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for dcMessage
/// </summary>
public class dcMessage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public dcMessage()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region Show LastComment on jobnumber

    /// <summary>
    /// Pass 0 for Unread and 1 For Read Message
    /// </summary>
    public DataTable ShowLastCommentbyJobnumber(string jobnumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT top 1 [Comments] FROM [JobComments] where JobNumber='" + jobnumber + "' order by ID desc";
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    #endregion


    #region Show all Job Read and UnRead Message By User Id

    /// <summary>
    /// Pass 0 for Unread and 1 For Read Message
    /// </summary>
    public DataTable ShowAll_Read_Unread_MessageByUserId(int Jobid, int ReadorUnreadId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectCountJobMessages";
            cmd.Parameters.AddWithValue("@RecipientUserID", Jobid);
            cmd.Parameters.AddWithValue("@TypeOfCount", ReadorUnreadId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion


    #region View Message and Sender info and Recever Info

    /// <summary>
    /// Pass U for Unread and R For Read Message
    /// </summary>
    public DataTable ShowAll_Message_and_Sender_MessageByUserId(int Uid, string ReadorUnreadId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ShowMessageText";
            cmd.Parameters.AddWithValue("@RecipientID", Uid);
            cmd.Parameters.AddWithValue("@MessageReadOrUnRead", ReadorUnreadId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    #endregion




    #region View Send Message and Recever info

    public DataTable Show_SendMessageText_info_UserId(int Uid)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ShowMessageText_SendedBy_UserId";
            cmd.Parameters.AddWithValue("@RecipientID", Uid);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion


    #region View Send info UserId and Name

    public DataTable Search_ReadMessageText_By_info_UserId_and_Name(int Uid, int SenderID)
    {

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ReadMessageText_SendedBy_UserId_And_Name";
            cmd.Parameters.AddWithValue("@RecipientID", Uid);
            cmd.Parameters.AddWithValue("@SenderID", SenderID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }


    public DataTable Search_SendMessageText_By_info_UserId_and_Name(int Uid, int SenderID)
    {

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ShowMessageText_SendedBy_UserId_And_Name";
            cmd.Parameters.AddWithValue("@RecipientID", SenderID);
            cmd.Parameters.AddWithValue("@SenderID", Uid);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion

    #region Reply message Reply

    public DataTable ReplyMessageByRecever(int MessageId)
    {

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_Reply_MessageByRecever";

            cmd.Parameters.AddWithValue("@MessageId", MessageId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion

    #region Unread To Read message

    public void Update_Unread_To_Read_Message(int MessageId)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_UpdateJobMessageUnreadToRead";
            cmd.Parameters.AddWithValue("@MessageId", MessageId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }
        catch (Exception ex)
        {


        }


    }

    #endregion





    #region Show Genral Message Sended TO User

    public DataTable ShowGenralMessageSendedTOUser(int SendUser)
    {

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_GenralMessageText_SendedBy_User_";

            cmd.Parameters.AddWithValue("@RecipientID", SendUser);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }



    public DataTable messageReadUnreadConvert1(int MID, string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_messageReadUnreadConvert";
            cmd.Parameters.AddWithValue("@MID", MID);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Flag", "R");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }



    public DataTable messageReadUnreadConvert(int MID, string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_messageReadUnreadConvert";
            cmd.Parameters.AddWithValue("@MID", MID);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Flag", "");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }



    public void DeleteMsgByID(int ID)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "procDeleteMsg";
            cmd.Parameters.AddWithValue("@ID", ID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }

    public void messageReadUnread_Convert(int MID, string flag)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_messageReadUnreadConvert";
            cmd.Parameters.AddWithValue("@MID", MID);
            cmd.Parameters.AddWithValue("@Flag", flag);
            cmd.Parameters.AddWithValue("@JobNumber", "");
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }

    #endregion



    #region ShoCommentCC Details

    /// <summary>
    /// Pass U for Unread and R For Read Message
    /// </summary>
    public DataTable ShowDetails_comments_CC(string JobNumber, int UserId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ShowCommentsCC_By_UserId";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@SenderUserId", UserId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    #endregion
}
