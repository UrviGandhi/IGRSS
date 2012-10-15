using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Refund_ActMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	
	protected void Button1_Click(object sender, EventArgs e)
	{
		FormView1.ChangeMode(FormViewMode.Insert);
	}
	protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
	{
		odsSelectedActDetails.ID = GridView1.SelectedDataKey.Value.ToString();
		FormView1.ChangeMode(FormViewMode.Edit);
	

	}
}
