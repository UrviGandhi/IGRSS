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
using IGRSS.DataAccessLayer;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using Resources;
public partial class Appeal_HighCourtAppeal : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvAppealHearing_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Name"] = gvAppealHearing.Rows[gvAppealHearing.SelectedIndex].Cells[0].Text;
      
        mvHighCourtDetails.SetActiveView(mvHighCourtDetails.Views[1]);
       // fvHighCourtDetails.ChangeMode(FormViewMode.Insert);
    }
    protected void odsHighCourtAppeal_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
       
        FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
    }
    protected void fvHighCourtDetails_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        Global.SetFormViewParameters(e.Values, AppealApplication.GetRow());
        e.Values.Add("AppealApplicationId", (Guid)gvAppealHearing.SelectedDataKey.Value);
    }
    protected void btnIProcessedIns_Click(object sender, EventArgs e)
    {
        mvHighCourtDetails.SetActiveView(mvHighCourtDetails.Views[2]);
         fvHighCourtDetails.ChangeMode(FormViewMode.Insert);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //mvHighCourtDetails.SetActiveView(mvHighCourtDetails.Views[1]);
        // fvHighCourtDetails.ChangeMode(FormViewMode.Insert);
    }
    protected void odsHighCourtAppeal_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvHighCourtDetails.SetActiveView(mvHighCourtDetails.Views[0]);

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
    protected void lblDisFileNo_DataBinding(object sender, EventArgs e)
    {
        ((Label)fvAppeal.FindControl("lblDisFileNo")).Text = Session["Name"].ToString();
   
    }
    protected void fvHighCourtDetails_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        mvHighCourtDetails.SetActiveView(mvHighCourtDetails.Views[0]);

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
