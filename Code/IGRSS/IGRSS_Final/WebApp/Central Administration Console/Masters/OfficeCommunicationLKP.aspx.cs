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
using IGRSS.BusinessLogicLayer.Administration;
public partial class Central_Administration_Console_OfficeCommunicationLKP : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
        //if (FvOfficeCommunication.CurrentMode == FormViewMode.Insert)
        // ((CheckBox)FvOfficeCommunication.FindControl("CheckBox1")).Checked = true;
	}
	protected void GvOfficeCommunication_SelectedIndexChanged(object sender, EventArgs e)
	{
        fldOfficeId.Value = GvOfficeCommunication.SelectedDataKey.Values["OfficeId"].ToString();
        fldCommunicationKey.Value = GvOfficeCommunication.SelectedDataKey.Values["CommunicationKey"].ToString();
		MvOfficeCommunication.SetActiveView(MvOfficeCommunication.Views[1]);
		FvOfficeCommunication.ChangeMode(FormViewMode.Edit);

	}
	protected void FvOfficeCommunication_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, OfficeCommunicationLKP.GetOfficeCommunicationRow());
	}
	protected void odsOfficeCommunicationById_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	protected void FvOfficeCommunication_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, OfficeCommunicationLKP.GetOfficeCommunicationRow());
	}
	protected void odsOfficeCommunicationById_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

	}
    protected void btnNew_Click(object sender, EventArgs e)
    {
        
        MvOfficeCommunication.SetActiveView(MvOfficeCommunication.Views[1]);
        FvOfficeCommunication.ChangeMode(FormViewMode.Insert);
        //((TextBox)FvOfficeCommunication.FindControl("txtCommunicationKeyIns")).Text="";
        //((TextBox)FvOfficeCommunication.FindControl("txtDescriptionIns")).Text = "";
    }
    protected void odsOfficeCommunicationById_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvOfficeCommunication.SetActiveView(MvOfficeCommunication.Views[0]);
        GvOfficeCommunication.DataBind();
    }
    protected void odsOfficeCommunicationById_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvOfficeCommunication.SetActiveView(MvOfficeCommunication.Views[0]);
        GvOfficeCommunication.DataBind();
    }
    protected void odsOfficeCommunicationById_Load(object sender, EventArgs e)
    {
        
    }
    protected void FvOfficeCommunication_Load(object sender, EventArgs e)
    {
        //if (FvOfficeCommunication.CurrentMode == FormViewMode.Insert)
        //{
        //    ((TextBox)FvOfficeCommunication.FindControl("txtCommunicationKeyIns")).Text = "";
        //    ((TextBox)FvOfficeCommunication.FindControl("txtDescriptionIns")).Text = "";
        //}
    }
    protected void GvOfficeCommunication_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GvOfficeCommunication.Rows)
        {

            if (gr.Cells[3].Text == Convert.ToString(true))


                gr.Cells[3].Text = "Yes";
            else
                gr.Cells[3].Text = "No";
        }
    }
    protected void odsOfficeCommunicationById_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}
