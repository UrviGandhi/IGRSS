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
public partial class Appeal_AppealHearing : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void btnSearch_Click(object sender, EventArgs e)
	{
		
	}
	protected void odsAppealHearing_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
	{
		
	}
	protected void gvAppealHearing_SelectedIndexChanged(object sender, EventArgs e)
	{
        Session["Name"] = gvAppealHearing.Rows[gvAppealHearing.SelectedIndex].Cells[0].Text;
      
        mvAppealHearing.SetActiveView(mvAppealHearing.Views[1]);
		fvAppealHearing.ChangeMode(FormViewMode.Insert);
	}
	protected void odsFormview_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		
	}
	protected void fvAppealHearing_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		e.Values.Add("AppealApplicationId", (Guid) gvAppealHearing.SelectedDataKey.Value);
	}
    protected void chkJudgement_CheckedChanged(object sender, EventArgs e)
    {
      
        if (((CheckBox)fvAppealHearing.FindControl("chkJudgement")).Checked)
        {
            ((DropDownList)fvAppealHearing.FindControl("ddlDecisionType")).Visible = true;
            ((Label)fvAppealHearing.FindControl("lblDecisionType")).Visible = true;
        }
            
        else
        {
            ((DropDownList)fvAppealHearing.FindControl("ddlDecisionType")).Visible = false;
            ((Label)fvAppealHearing.FindControl("lblDecisionType")).Visible = false;
        }
      
    }
    protected void fvAppealHearing_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        object o = e.Values[0];
        viewHearingDetails.DataBind();
    }
    protected void odsFormview_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Judgement Has Taken for This Appeal", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
    protected void fvAppeal_Load(object sender, EventArgs e)
    {
       // if (fvAppeal.CurrentMode == FormViewMode.ReadOnly)
       //{
       //    ((Label)fvAppeal.FindControl("lblDisFileNo")).Text = Session["Name"].ToString();
       // }
    }
    protected void lblDisFileNo_DataBinding(object sender, EventArgs e)
    {
        ((Label)fvAppeal.FindControl("lblDisFileNo")).Text = Session["Name"].ToString();
    }
    protected void btnCancelIns_Click(object sender, EventArgs e)
    {

        mvAppealHearing.SetActiveView(mvAppealHearing.Views[0]);
    }
}
