
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
public partial class Central_Administration_Console_ItemMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();

	}
	protected void OdsItemMaster_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		
	}
	protected void OdsItemMaster_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
        //FormViewParameter Parameters = new FormViewParameter();
        //Parameters.Values = (DataRow) e.InputParameters["Values"];
        //e.InputParameters["Parameter"] = Parameters;
        //e.InputParameters.Remove("Values");
	}
	protected void FvItemMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		
	}
	protected void FvItemMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		

	}
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
        mvItemMaster.SetActiveView(mvItemMaster.Views[1]);
        FvItemMaster.ChangeMode(FormViewMode.Insert);
        ((TextBox)FvItemMaster.FindControl("txtNameIns")).Text = "";
        ((TextBox)FvItemMaster.FindControl("txtDescriptionIns")).Text = "";


    }
    protected void GvItemMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvItemMaster.SetActiveView(mvItemMaster.Views[1]);
        FvItemMaster.ChangeMode(FormViewMode.Edit);
    }
    protected void OdsItemMaster_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvItemMaster.SetActiveView(mvItemMaster.Views[0]);
        GvItemMaster.DataBind();
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
    protected void OdsItemMaster_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvItemMaster.SetActiveView(mvItemMaster.Views[0]);
        GvItemMaster.DataBind();
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
        mvItemMaster.SetActiveView(mvItemMaster.Views[0]);
        GvItemMaster.DataBind();
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        mvItemMaster.SetActiveView(mvItemMaster.Views[0]);
        GvItemMaster.DataBind();
    }
}
