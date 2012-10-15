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
using IGRSS.DataAccessLayer.ConfigTableAdapters;
using Resources;
public partial class License_VendorOffence : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvRenewVendor_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        Session["Name"]=gvRenewVendor.Rows[gvRenewVendor.SelectedIndex].Cells[2].Text;
        mvVendorOffence.SetActiveView(mvVendorOffence.Views[1]);
        FvVendorOffence.ChangeMode(FormViewMode.Insert);
    }
    protected void FvVendorOffence_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        Global.SetFormViewParameters(e.Values, VendorOffence.GetRow());
        e.Values.Add("LicenseId", (Guid)gvRenewVendor.SelectedDataKey.Value);
    }
    protected void odsVendorOffence_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
       
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void FvVendorOffence_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        mvVendorOffence.SetActiveView(mvVendorOffence.Views[0]);
        if (e.Exception == null)
        {
            
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
           
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }

    protected void FvVendorOffence_Load(object sender, EventArgs e)
    {
        
    }
    protected void FvVendorOffence_DataBound(object sender, EventArgs e)
    {
        if (FvVendorOffence.CurrentMode == FormViewMode.Insert)
        {
            ((TextBox)FvVendorOffence.FindControl("txtNameIns")).Text = Session["Name"].ToString();
        }
    }
}
