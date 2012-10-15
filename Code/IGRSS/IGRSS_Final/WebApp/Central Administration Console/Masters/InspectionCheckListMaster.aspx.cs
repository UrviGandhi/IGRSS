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
public partial class Central_Administration_Console_InspectionCheckListMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
	}


	protected void OdsInspectionCheckListMaster_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");


	}
	protected void FvInspectionCheckListMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, Inspection.GetInspectionCheckListMasterRow());

	}
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        mvInspectionCheckListMaster.SetActiveView(mvInspectionCheckListMaster.Views[1]);
        FvInspectionCheckListMaster.ChangeMode(FormViewMode.Edit);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
        mvInspectionCheckListMaster.SetActiveView(mvInspectionCheckListMaster.Views[1]);
        FvInspectionCheckListMaster.ChangeMode(FormViewMode.Insert);
    }
    protected void FvInspectionCheckListMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
       //    Global.SetFormViewParameters(e.NewValues, Inspection.GetInspectionCheckListMasterRow());
    }
    protected void OdsInspectionCheckListMaster_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");

    }
    protected void OdsInspectionCheckListMaster_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvInspectionCheckListMaster.SetActiveView(mvInspectionCheckListMaster.Views[0]);
        GridView1.DataBind();
        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
         
       
    }
    protected void OdsInspectionCheckListMaster_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvInspectionCheckListMaster.SetActiveView(mvInspectionCheckListMaster.Views[0]);
        GridView1.DataBind();
        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
         
    }
    protected void btnCancelIns_Click(object sender, EventArgs e)
    {
        mvInspectionCheckListMaster.SetActiveView(mvInspectionCheckListMaster.Views[0]);
        GridView1.DataBind();
    }
    protected void btnCancelUpd_Click(object sender, EventArgs e)
    {
        mvInspectionCheckListMaster.SetActiveView(mvInspectionCheckListMaster.Views[0]);
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
       
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {

            if (gr.Cells[1].Text == Convert.ToString(true))


                gr.Cells[1].Text = "Yes";
            else
                gr.Cells[1].Text = "No";
        }
       


    }
    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
       
    }
    protected void FvInspectionCheckListMaster_Load(object sender, EventArgs e)
    {
        if (FvInspectionCheckListMaster.CurrentMode == FormViewMode.Insert)
        {
            ((TextBox)FvInspectionCheckListMaster.FindControl("txtDescriptionIns")).Text = "";
            ((CheckBox)FvInspectionCheckListMaster.FindControl("c")).Checked = false;
        }
    }
}
