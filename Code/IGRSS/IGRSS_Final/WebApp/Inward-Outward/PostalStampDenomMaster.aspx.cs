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
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;

public partial class Inward_Outward_PostalStampDenomMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void fvPostalStampDenom_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		//Global.SetFormViewParameters(e.Values, InwardOutward.GetPostalStampRow());
	}
	protected void fvPostalStampDenom_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		//Global.SetFormViewParameters(e.NewValues, InwardOutward.GetPostalStampRow());
	}
	protected void odsPostalStamp_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	protected void gvPostalDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		mvPostalStamp.SetActiveView(mvPostalStamp.Views[1]);
		fvPostalStampDenom.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void gvPostalDetails_RowDeleted(object sender, GridViewDeletedEventArgs e)
	{
		gvPostalDetails.DataBind();
	}
    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvPostalStamp.SetActiveView(mvPostalStamp.Views[1]);
        fvPostalStampDenom.ChangeMode(FormViewMode.Insert);
    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
}
