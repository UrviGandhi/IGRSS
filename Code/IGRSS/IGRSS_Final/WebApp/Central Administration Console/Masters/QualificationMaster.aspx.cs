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
public partial class Central_Administration_Console_QualificationMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
	}
	protected void FvQualificationMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, Employee.GetQualificationRow());

	}
	protected void OdsQualificationMaster_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
    protected void GvFeeMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvQualificationMaster.SetActiveView(mvQualificationMaster.Views[1]);
        FvQualificationMaster.ChangeMode(FormViewMode.Edit);
    }
    protected void OdsQualificationMaster_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        mvQualificationMaster.SetActiveView(mvQualificationMaster.Views[1]);
        FvQualificationMaster.ChangeMode(FormViewMode.Insert);
        ((TextBox)FvQualificationMaster.FindControl("txtDescriptionIns")).Text = "";
        ((TextBox)FvQualificationMaster.FindControl("txtNameIns")).Text = "";


    }
    protected void FvQualificationMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Global.SetFormViewParameters(e.NewValues, Employee.GetQualificationRow());
    }
    protected void odsQualification_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {

    }
    protected void OdsQualificationMaster_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvQualificationMaster.SetActiveView(mvQualificationMaster.Views[0]);
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
    protected void OdsQualificationMaster_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvQualificationMaster.SetActiveView(mvQualificationMaster.Views[0]);
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
        mvQualificationMaster.SetActiveView(mvQualificationMaster.Views[0]);
        GvFeeMaster.DataBind();
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        mvQualificationMaster.SetActiveView(mvQualificationMaster.Views[0]);
        GvFeeMaster.DataBind();
    }
}
