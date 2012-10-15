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
using Resources;

using FeeMasterRow = IGRSS.DataAccessLayer.Adjudication.FeeMasterRow;



public partial class Central_Administration_Console_FeeMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
	}
	protected void GvFeeMaster_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvFeeMaster.SetActiveView(MvFeeMaster.Views[1]);
		FvFeeMaster.ChangeMode(FormViewMode.Edit);

		
	}
    protected void FvFeeMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Global.SetFormViewParameters(e.NewValues, AdjudicationRequest.GetFeeMasterRow());

    }
    protected void FvFeeMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
		Global.SetFormViewParameters(e.Values, AdjudicationRequest.GetFeeMasterRow());
        
    }
    protected void odsFeeMasterById_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");


    }
    protected void odsFeeMasterById_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
        MvFeeMaster.SetActiveView(MvFeeMaster.Views[1]);
        FvFeeMaster.ChangeMode(FormViewMode.Insert);
        ((TextBox)FvFeeMaster.FindControl("txtDescriptionIns")).Text = "";
        ((TextBox)FvFeeMaster.FindControl("txtNameIns")).Text = "";
          ((TextBox)FvFeeMaster.FindControl("txtAmountIns")).Text = "";

    }
    protected void odsFeeMasterById_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvFeeMaster.SetActiveView(MvFeeMaster.Views[0]);
        GvFeeMaster.SelectedIndex = -1;
        GvFeeMaster.DataBind();
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
    protected void odsFeeMasterById_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvFeeMaster.SetActiveView(MvFeeMaster.Views[0]);
        GvFeeMaster.SelectedIndex = -1;
        GvFeeMaster.DataBind();
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MvFeeMaster.SetActiveView(MvFeeMaster.Views[0]);
      
        GvFeeMaster.DataBind();
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        MvFeeMaster.SetActiveView(MvFeeMaster.Views[0]);
      
        GvFeeMaster.DataBind();
    }
}
