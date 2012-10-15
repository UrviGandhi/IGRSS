
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
public partial class Central_Administration_Console_InspectionTypeMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();

	}

	protected void OdsInspectionTypeMaster_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{

		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

	}
	protected void FvInspectionTypeMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{

	 Global.SetFormViewParameters(e.Values,Inspection.GetInspectionTypeMasterRow());

	}







    protected void FvInspectionTypeMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Global.SetFormViewParameters(e.NewValues,Inspection.GetInspectionTypeMasterRow());
    }
    protected void OdsInspectionTypeMaster_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
        mvInspectionTypeMaster.SetActiveView(mvInspectionTypeMaster.Views[1]);
        FvInspectionTypeMaster.ChangeMode(FormViewMode.Insert);
        ((TextBox)FvInspectionTypeMaster.FindControl("txtNameIns")).Text = "";
        ((TextBox)FvInspectionTypeMaster.FindControl("txtDescriptionIns")).Text = "";

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
         mvInspectionTypeMaster.SetActiveView(mvInspectionTypeMaster.Views[1]);
         FvInspectionTypeMaster.ChangeMode(FormViewMode.Edit);
    }
    protected void OdsInspectionTypeMaster_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvInspectionTypeMaster.SetActiveView(mvInspectionTypeMaster.Views[0]);
        GridView1.DataBind();
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
    protected void OdsInspectionTypeMaster_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvInspectionTypeMaster.SetActiveView(mvInspectionTypeMaster.Views[0]);
        GridView1.DataBind();
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
        mvInspectionTypeMaster.SetActiveView(mvInspectionTypeMaster.Views[0]);
        GridView1.DataBind();
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        mvInspectionTypeMaster.SetActiveView(mvInspectionTypeMaster.Views[0]);
        GridView1.DataBind();
    }
}
