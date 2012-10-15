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
using System.Threading;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using IGRSS.BusinessLogicLayer.Administration;
using Resources;
public partial class Central_Administration_Console_Offices_OfficeMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();

	}
	protected void FvOfficeMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, OfficeManagementMaster.GetOfficeMasterRow());

	
	}
	protected void odsOfficeMaster_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

	}
	protected void GvOfficeMaster_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvOfficeMaster.SetActiveView(MvOfficeMaster.Views[1]);
		FvOfficeMaster.ChangeMode(FormViewMode.Edit);

	}
	protected void FvOfficeMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, OfficeManagementMaster.GetOfficeMasterRow());

	

}
	protected void odsOfficeMaster_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

		
	}
    protected void BtnAddNew_Click(object sender, EventArgs e)
    {
        MvOfficeMaster.SetActiveView(MvOfficeMaster.Views[1]);
        FvOfficeMaster.ChangeMode(FormViewMode.Insert);
        FvOfficeMaster.DataBind();  
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MvOfficeMaster.SetActiveView(MvOfficeMaster.Views[0]);
        }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        MvOfficeMaster.SetActiveView(MvOfficeMaster.Views[0]);
        
    }
    protected void odsOfficeMaster_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvOfficeMaster.SetActiveView(MvOfficeMaster.Views[0]);
        GvOfficeMaster.DataBind();
        if (e.Exception == null)
        {
          
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
    protected void odsOfficeMaster_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvOfficeMaster.SetActiveView(MvOfficeMaster.Views[0]);
        GvOfficeMaster.DataBind();
        if (e.Exception == null)
        {

            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
}
