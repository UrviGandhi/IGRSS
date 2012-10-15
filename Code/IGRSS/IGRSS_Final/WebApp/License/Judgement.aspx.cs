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
public partial class License_Judgement : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvRenewVendor_SelectedIndexChanged
                    (object sender, EventArgs e)
    {
        mvJudgement.SetActiveView(mvJudgement.Views[1]);
    }
    protected void gvEVendorOffenceDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = mvJudgement.ActiveViewIndex;
        Session["Index"]=i;
        mvJudgement.SetActiveView(mvJudgement.Views[2]);
        fvInternalHearing.ChangeMode(FormViewMode.Insert);
    }
    protected void ddlJudgementType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void fvInternalHearing_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        Global.SetFormViewParameters(e.Values, VendorOffence.GetInvestigationRow());
        if(((CheckBox)fvInternalHearing.FindControl("chkJudgement")).Checked)
            e.Values.Add("Remarks",((TextBox)fvInternalHearing.FindControl("txtRemarksIns")).Text );
        else
            e.Values.Add("Remarks",null);
       
        e.Values.Add("InvestigationType","In");

    }
    protected void ObjectDataSource2_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void chkJudgement_CheckedChanged(object sender, EventArgs e)
    {
        if (((CheckBox)fvInternalHearing.FindControl("chkJudgement")).Checked)
        {
            ((TextBox)fvInternalHearing.FindControl("txtRemarksIns")).Visible = true;
            ((Label)fvInternalHearing.FindControl("lblRemarksIns")).Visible = true;
        }
        else
        {
            ((TextBox)fvInternalHearing.FindControl("txtRemarksIns")).Visible = false;
            ((Label)fvInternalHearing.FindControl("lblRemarksIns")).Visible = false;
        }
    }
    
   
    protected void gvHighCourtFileDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = mvJudgement.ActiveViewIndex;
        Session["Index"] = i;
    }



    protected void ObjectDataSource2_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
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
}
