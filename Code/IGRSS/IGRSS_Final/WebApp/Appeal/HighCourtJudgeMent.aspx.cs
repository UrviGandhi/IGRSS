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
public partial class Appeal_HighCourtJudgeMent : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //if (txtAppealNo.Text == "" && txtcaseNo.Text == "")
        //{
        //    ((Label)mvHighCourtJudgeMentDetails.FindControl("lblMessage")).Visible = true;

        //}
        //else
        //{
        //    mvHighCourtJudgeMentDetails.SetActiveView(mvHighCourtJudgeMentDetails.Views[1]);
        //    fvHighCourtDetails.ChangeMode(FormViewMode.ReadOnly);
        //}
    }
    protected void btnAddHighCourtDetailsIns_Click(object sender, EventArgs e)
    {
        mvHighCourtJudgeMentDetails.SetActiveView(mvHighCourtJudgeMentDetails.Views[2]);
        fvHighCourtJudgement.ChangeMode(FormViewMode.Insert);
    }
    protected void fvHighCourtDetails_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void odsAddJudgementDetails_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        
    }
    protected void fvHighCourtJudgement_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values.Add("AppealApplicationId", (Guid)fvHighCourtDetails.SelectedValue);
    }
    protected void fvHighCourtJudgement_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        gvExtJugDetails.DataBind();
    }
    protected void fvHighCourtDetails_DataBound(object sender, EventArgs e)
    {
        if (fvHighCourtDetails.DataItemCount == 0)
            btnAddHighCourtDetailsIns.Enabled = false;
    }
    protected void fvHighCourtDetails_Load(object sender, EventArgs e)
    {
        
    }
    protected void odsAddJudgementDetails_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
       
    }

    protected void gvAppealHearing_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Name"] = gvAppealHearing.Rows[gvAppealHearing.SelectedIndex].Cells[0].Text;
      
        mvHighCourtJudgeMentDetails.SetActiveView(mvHighCourtJudgeMentDetails.Views[1]);
        
    }
    protected void lblDisFileNo_DataBinding(object sender, EventArgs e)
    {
        ((Label)fvAppeal.FindControl("lblDisFileNo")).Text = Session["Name"].ToString();
    }
    protected void odsHighCourt_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvHighCourtJudgeMentDetails.SetActiveView(mvHighCourtJudgeMentDetails.Views[0]);
        gvAppealHearing.DataBind();
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
}