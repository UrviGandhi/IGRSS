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

public partial class License_VendorHighCourt : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnFileNo_Click(object sender, EventArgs e)
    {
        mvInspectionDetails.SetActiveView(mvInspectionDetails.Views[1]);
        FvVendorOffence.ChangeMode(FormViewMode.ReadOnly);
        fldVendorOffenceId.Value = FvVendorOffence.DataKey.Value.ToString();
    }
    //protected void btnAddHighCourtdetails_Click(object sender, EventArgs e)
    //{
    //    mvInspectionDetails.SetActiveView(mvInspectionDetails.Views[2]);
    //    fvHighCourtdetails.ChangeMode(FormViewMode.Insert);
    //}
    protected void fvHighCourtdetails_ItemInserting(object sender, FormViewInsertEventArgs e)
    {

        e.Values.Add("VendorOffenceId", gvEVendorOffenceDetails.SelectedDataKey.Value);
    }
    protected void gvRenewVendor_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvInspectionDetails.SetActiveView(mvInspectionDetails.Views[1]);
        FvVendorOffence.ChangeMode(FormViewMode.ReadOnly);
    }

    protected void odsHighCourtAppeal_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Offence Alraedy Went to High Court", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
    protected void gvEVendorOffenceDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvInspectionDetails.SetActiveView(mvInspectionDetails.Views[2]);
        fvHighCourtdetails.ChangeMode(FormViewMode.Insert);
    }
}
