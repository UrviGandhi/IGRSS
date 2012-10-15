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

public partial class Test_Calculator : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void fvResult_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
	{
	}

	protected void fvStampDutyCalculation_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{
		((FormView) sender).ChangeMode(FormViewMode.ReadOnly);

	}
	protected void fvStampDutyCalculation_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
	{
		((FormView) sender).ChangeMode(FormViewMode.ReadOnly);
		ArrayList items = new ArrayList();items.Add(((FormView) sender).DataItem);
		fvResult.DataSource = items;
		fvResult.DataBind();
	}
	protected void btnCalculate_Click(object sender, EventArgs e)
	{
		fvResult.DataSourceID = ObjectDataSource1.ID;
		fvResult.DataBind();
	}
}
