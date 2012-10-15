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
using IGRSS.BusinessObjects;
using IGRSS.BusinessLogicLayer;
public partial class Inward_Outward_PostalStampRequest : IgrssPage
{	
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void fvStampRequest_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
      // Global.SetFormViewParameters(e.Values, InwardOutward.GetPostalStampRequestRow());
	}
	protected void  odsPostalReqDetails_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	protected void fvStampRequest_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
	//	Global.SetFormViewParameters(e.NewValues, InwardOutward.GetPostalStampRequestRow());
	}
	protected void gvPostalStampReqDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		mvPostalStampRequest.SetActiveView(mvPostalStampRequest.Views[1]);
		fvStampRequest.ChangeMode(FormViewMode.ReadOnly);
	}
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvPostalStampRequest.SetActiveView(mvPostalStampRequest.Views[1]);
        fvStampRequest.ChangeMode(FormViewMode.Insert);
    }
}
	


