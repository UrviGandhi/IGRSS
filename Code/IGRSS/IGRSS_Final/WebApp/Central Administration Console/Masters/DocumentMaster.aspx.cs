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
using DocumentMasterRow = IGRSS.DataAccessLayer.Adjudication.DocumentMasterRow;



public partial class Central_Administration_Console_DocumentMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
	}
	protected void GvDocumentMasters_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvDocumentMaster.SetActiveView(MvDocumentMaster.Views[1]);
		FvDocumentMaster.ChangeMode(FormViewMode.Edit);
	}



	protected void FvDocumentMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
        Global.SetFormViewParameters(e.NewValues, AdjudicationRequest.GetDocumentMasterRow());
	}
	protected void odsDocumentMasterById_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
        //e.InputParameters.Add("DocumentTypeId", (Guid)GvDocumentMasters.SelectedDataKey.Value);
	}
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
        MvDocumentMaster.SetActiveView(MvDocumentMaster.Views[1]);
        FvDocumentMaster.ChangeMode(FormViewMode.Insert);
        ((TextBox)FvDocumentMaster.FindControl("txtNameIns")).Text="";
        ((TextBox)FvDocumentMaster.FindControl("txtDescriptionIns")).Text="";
    }
    protected void FvDocumentMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        Global.SetFormViewParameters(e.Values, AdjudicationRequest.GetDocumentMasterRow());
    }
    protected void odsDocumentMasterById_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");


    }
    protected void odsDocumentMasterById_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvDocumentMaster.SetActiveView(MvDocumentMaster.Views[0]);
        GvDocumentMasters.DataBind();
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
    protected void odsDocumentMasterById_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvDocumentMaster.SetActiveView(MvDocumentMaster.Views[0]);
        GvDocumentMasters.DataBind();
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
        MvDocumentMaster.SetActiveView(MvDocumentMaster.Views[0]);
        GvDocumentMasters.DataBind();
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        MvDocumentMaster.SetActiveView(MvDocumentMaster.Views[0]);
        GvDocumentMasters.DataBind();
    }
}
