using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Services.Protocols;
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public partial class Admin_ManageMetedOrder : System.Web.UI.Page
{
    Dc_Category objCat = new Dc_Category();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
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
        DataTable dt = objCat.showAllMetedCategory();
        rptr.DataSource = dt;
        rptr.DataBind();
    }

    public void datashow(int Id)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString);
        string stmt = "select CatTBL.Category,SubCtbl.* from MetedCategory_TBL as CatTBL, MetedSubCat_TBL as SubCtbl where SubCtbl.CatId=" + Id + " and SubCtbl.CatId=CatTBL.CatID order by SwapId";
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
            cmd.CommandText = "Update synoris_admin.MetedSubCat_TBL SET SwapId=@DisplayOrder where SubCatId=@id and CatId=" + CatId + "";
            cmd.Parameters.AddWithValue("@id", id);

            cmd.Parameters.AddWithValue("@DisplayOrder", DisplayOrder);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
        }
        catch (Exception ex)
        { }



    }
   
    public void rptr_ItemCommand(Object Sender, RepeaterCommandEventArgs e)
    {
        CatId = Convert.ToInt32(e.CommandArgument.ToString());
        datashow(CatId);
    }
}
