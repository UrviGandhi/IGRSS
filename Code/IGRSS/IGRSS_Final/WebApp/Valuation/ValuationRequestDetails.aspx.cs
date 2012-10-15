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

public partial class Valuation_ValuationRequestDetails : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		string id = Request.Params["ValReqId"];
		if (null != id)
		{
			FormView1.PageIndex = Convert.ToInt32(id);
			FormView1.ChangeMode(FormViewMode.Edit);
		}
	}
	protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
	{
		Response.Redirect("Default.aspx");
	}

    protected void odsValuationRequest_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
}
