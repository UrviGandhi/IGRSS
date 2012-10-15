using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using IGRSS.BusinessLogicLayer;
using IGRSS.DataAccessLayer.ConfigTableAdapters;
public partial class Telephone_Default : IgrssPage
{
	DataTable dt = new DataTable();
	protected void Page_Load(object sender, EventArgs e)
	{
		
	}
	protected void Button1_Click(object sender, EventArgs e)
	{
      Label ll =(Label)Page.Master.FindControl("lblmaster");
        ll.Text = "Master page control found";

       

		
	}


    protected void Button1_Click1(object sender, EventArgs e)
    {
       // //Calling Stored Procedure without Input parameter
       //         string s = ConfigurationManager.ConnectionStrings["IGRSS_FINALConnectionString"];
       //         SqlConnection con = new SqlConnection("Trusted_Connection=Yes;data source=blrserver\\sql2005;DataBase=IGRSS_FINAL");
       //         SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IGRSS_FINALConnectionString"].ToString());
       //         SqlCommand command = new SqlCommand("GetAppealApplication", con);
       //         SqlDataAdapter adapter = new SqlDataAdapter("GetAppealApplication", con);
       //         DataSet ds = new DataSet();
       //         adapter.Fill(ds, "AppealApplication");
       //         GridView1.DataSource = ds;
       //         GridView1.DataBind();
       ////Calling Stored Procedure with parameter
        
       //         SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IGRSS_FINALConnectionString"].ToString());
       //         SqlCommand command = new SqlCommand("GetAppealApplicationByAppealNo",con);
       //         command.CommandType = CommandType.StoredProcedure;
       //         command.Parameters.Add("@AppealSlN0", SqlDbType.VarChar);
       //         command.Parameters["@AppealSlN0"].Value = 22;
       //         SqlDataAdapter adapter = new SqlDataAdapter(command);
       //         DataSet ds = new DataSet();
       //         adapter.Fill(ds, "AppealApplication");
       //         GridView1.DataSource = ds;
       //         GridView1.DataBind();




    }
}

