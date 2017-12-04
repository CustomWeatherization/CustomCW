using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System;
using System.Configuration;
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public partial class Admin_ManageCommonOrder : System.Web.UI.Page
{
    CommonCategory objCat = new CommonCategory();
    public static int CatId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowAllCatgory();
        }
        datashow(CatId);
    }
    public void ShowAllCatgory()
    {
        DataTable dt = objCat.showAllPrivateCategory();
        rptr.DataSource = dt;
        rptr.DataBind();
    }

    public void datashow(int Id)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString);
        string stmt = "select CatTBL.Category,SubCtbl.* from CommonCatTBL as CatTBL, CommonSubCatTBL as SubCtbl where SubCtbl.CatId=" + Id + " and SubCtbl.CatId=CatTBL.CatID order by SwapId";
        SqlCommand cmd = new SqlCommand(stmt, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        con.Open();
        da.Fill(dt);
        con.Close();
        GridViewReorder.DataSource = dt;
        GridViewReorder.DataBind();
    }
    [WebMethod]
    public static void GridViewReorders(string Reorder)
    {

        string[] ListID = Reorder.Split('|');

        for (int i = 0; i < ListID.Length; i++)
        {
            if (ListID[i] != "" && ListID[i] != null)
            {
                updateGridViewReorder(Convert.ToInt16(ListID[i]), i + 1);
            }
        }
    }

    public static void updateGridViewReorder(int id, int DisplayOrder)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString);
        try
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;

            cmd.Connection = con;
            cmd.CommandText = "Update synoris_admin.CommonSubCatTBL SET SwapId=@DisplayOrder where SubCatId=@id and CatId=" + CatId + "";
            cmd.Parameters.AddWithValue("@id", id);

            cmd.Parameters.AddWithValue("@DisplayOrder", DisplayOrder);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
        }
        catch (Exception ex)
        { }



    }

    public void ShowAllCategory()
    {
        DataTable dt = objCat.showAllPrivateCategory();
        rptr.DataSource = dt;
        rptr.DataBind();
    }
    public void rptr_ItemCommand(Object Sender, RepeaterCommandEventArgs e)
    {
        CatId = Convert.ToInt32(e.CommandArgument.ToString());
        datashow(CatId);
    }
}