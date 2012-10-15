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

public partial class Refund_RevenueStampsMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
		
	}
	protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
	{
		//odsSelectedStampDetails.SelectMethod= GridView1.SelectedDataKey.Value.ToString();
		odsSelectedStampDetails.ID = GridView1.SelectedDataKey.Value.ToString();
		FVRevenueStampMaster.ChangeMode(FormViewMode.Edit);
	}
	protected void odsSelectedStampDetails_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
	{

	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		FVRevenueStampMaster.ChangeMode(FormViewMode.Insert);
	}
}
