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
using Resources;
public partial class Central_Administration_Console_RevenueStampMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();

	}

	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{

	}
	protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
	{
		//odsSelectedStampDetails.SelectMethod= GridView1.SelectedDataKey.Value.ToString();
        mvRevenueStampMaster.SetActiveView(mvRevenueStampMaster.Views[1]);
		odsSelectedStampDetails.ID = GridView1.SelectedDataKey.Value.ToString();
		FVRevenueStampMaster.ChangeMode(FormViewMode.Edit);
	}
	protected void odsSelectedStampDetails_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
	{

	}
	protected void Button1_Click(object sender, EventArgs e)
	{
        mvRevenueStampMaster.SetActiveView(mvRevenueStampMaster.Views[1]);
        FVRevenueStampMaster.ChangeMode(FormViewMode.Insert);

        //((TextBox)FVRevenueStampMaster.FindControl("txtDescriptionIns")).Text = "";
        //((TextBox)FVRevenueStampMaster.FindControl("txtNameIns")).Text = "";
        //((TextBox)FVRevenueStampMaster.FindControl("txtAmount")).Text = "";
    
    }
    protected void odsSelectedStampDetails_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvRevenueStampMaster.SetActiveView(mvRevenueStampMaster.Views[0]);
        GridView1.DataBind();
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }

    }
    protected void odsSelectedStampDetails_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvRevenueStampMaster.SetActiveView(mvRevenueStampMaster.Views[0]);
        GridView1.DataBind();
        if (e.Exception == null)
        {
          
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }

    protected void btnCancelIns_Click(object sender, EventArgs e)
    {
        mvRevenueStampMaster.SetActiveView(mvRevenueStampMaster.Views[0]);
        GridView1.DataBind();
    }
    protected void btnCancelUpd_Click(object sender, EventArgs e)
    {
        mvRevenueStampMaster.SetActiveView(mvRevenueStampMaster.Views[0]);
        GridView1.DataBind();
    }
    protected void FVRevenueStampMaster_Load(object sender, EventArgs e)
    {
        //if (FVRevenueStampMaster.CurrentMode == FormViewMode.Insert)
        //{
        //    ((TextBox)FVRevenueStampMaster.FindControl("txtDescriptionIns")).Text = "";
        //    ((TextBox)FVRevenueStampMaster.FindControl("txtNameIns")).Text = "";
        //    ((TextBox)FVRevenueStampMaster.FindControl("txtAmount")).Text = "";
        //}
    }
}
