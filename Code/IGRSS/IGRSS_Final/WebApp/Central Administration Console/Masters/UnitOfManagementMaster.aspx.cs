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

public partial class Central_Administration_Console_UnitOfManagementMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
	}
	protected void OdsUOMMaster_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
        //FormViewParameter Parameters = new FormViewParameter();
        //Parameters.Values = (DataRow) e.InputParameters["Values"];
        //e.InputParameters["Parameter"] = Parameters;
        //e.InputParameters.Remove("Values");


	}
	protected void FvUOMMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, Purchase.GetRow());

	}
	protected void OdsUOMMaster_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{


        //FormViewParameter Parameters = new FormViewParameter();
        //Parameters.Values = (DataRow) e.InputParameters["Values"];
        //e.InputParameters["Parameter"] = Parameters;
        //e.InputParameters.Remove("Values");
	}
	protected void FvUOMMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
    // Global.SetFormViewParameters(e.NewValues, Purchase.GetRow());

	}


    protected void odsUOMMasterDetails_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {

    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        mvUOMMaster.SetActiveView(mvUOMMaster.Views[1]);
        FvUOMMaster.ChangeMode(FormViewMode.Insert);
        ((TextBox)FvUOMMaster.FindControl("txtUOMDescriptionIns")).Text = "";
        ((TextBox)FvUOMMaster.FindControl("txtNameIns")).Text = "";
    }
    protected void GvItemMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvUOMMaster.SetActiveView(mvUOMMaster.Views[1]);
        FvUOMMaster.ChangeMode(FormViewMode.Edit);
    }
    protected void OdsUOMMaster_Updating1(object sender, ObjectDataSourceMethodEventArgs e)
    {
        
    }
    protected void btnNew_Click1(object sender, EventArgs e)
    {

    }
    protected void OdsUOMMaster_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvUOMMaster.SetActiveView(mvUOMMaster.Views[0]);
        GvItemMaster.DataBind();
    }
    protected void OdsUOMMaster_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        
        mvUOMMaster.SetActiveView(mvUOMMaster.Views[0]);
        GvItemMaster.DataBind();
    }
    protected void btnNew_Click2(object sender, EventArgs e)
    {

    }
    protected void OdsUOMMaster_Inserting1(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        mvUOMMaster.SetActiveView(mvUOMMaster.Views[0]);
        GvItemMaster.DataBind();
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        mvUOMMaster.SetActiveView(mvUOMMaster.Views[0]);
        GvItemMaster.DataBind();
    }
}
