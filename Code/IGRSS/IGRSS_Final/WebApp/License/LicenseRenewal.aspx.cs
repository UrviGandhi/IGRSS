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
using System.Collections.Generic;
using Resources;
public partial class License_LicenseRenewal : IgrssPage
{
	LicenseMasterBLL ObjReNewLic = new LicenseMasterBLL();
	LicenseApplication objLicRej = new LicenseApplication();

	protected void Page_Load(object sender, EventArgs e)
	{
		string qq = ConfigurationManager.AppSettings["IGRSS_FINALConnectionString"];
	}
	protected void fvVendorDetails_ItemCommand(object sender, FormViewCommandEventArgs e)
	{

		if (e.CommandName == "RenewVendorLicense")
		{
			Guid licID =new Guid (gvRenewVendor.SelectedDataKey.Value.ToString());
			string IssueDate = ((TextBox) fvVendorDetails.FindControl("txtIssueDate")).Text;
			string EffectiveDate = ((TextBox) fvVendorDetails.FindControl("txtEffectiveDate")).Text;
			string ExpiryDate = ((TextBox) fvVendorDetails.FindControl("txtExpiryDate")).Text;
			ObjReNewLic.RenewVendorLicenses(Convert.ToDateTime(IssueDate), Convert.ToDateTime(EffectiveDate), Convert.ToDateTime(ExpiryDate), licID);
			mvLicRenew.SetActiveView(mvLicRenew.Views[0]);
			txtLicenseNo.Text = "";
		}
		if (e.CommandName == "RejectVendorLicense")
		{
			Guid licID = new Guid(gvRenewVendor.SelectedDataKey.Value.ToString());
			objLicRej.RejectVenorLicense(licID);

		}
		if (e.CommandName == "UpdateAppDate")
		{
			string ReNewAppDate = ((TextBox) fvVendorDetails.FindControl("txtApplicationDate")).Text;
			Guid licID = new Guid(gvRenewVendor.SelectedDataKey.Value.ToString());
			objLicRej.RenewAppDate(licID, Convert.ToDateTime(ReNewAppDate));
			//fvVendorDetails.ChangeMode(FormViewMode.Edit);
            mvLicRenew.SetActiveView(mvLicRenew.Views[0]);
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);  
           
		}
	}
	protected void fvVendorDetails_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{
		
	}
	protected void btnLicenseNo_Click(object sender, EventArgs e)
	{
		
		//gvRenewVendor.DataBind();
		gvRenewHistry.Visible = false;
	}
	protected void gvRenewVendor_SelectedIndexChanged(object sender, EventArgs e)
	{
		mvLicRenew.SetActiveView(mvLicRenew.Views[2]);
		fvVendorDetails.ChangeMode(FormViewMode.Edit);
	}
	protected void InsertButton_Click(object sender, EventArgs e)
	{
        Dictionary<string, string> reportParams = new Dictionary<string, string>();
        string ApplnNo = ((TextBox)fvVendorDetails.FindControl("ApplnNumberTextBox")).Text;
        reportParams.Add("ApplnNumber", ApplnNo);
        Session["ReportParams"] = reportParams;
        Session["ReportName"] = "LicenseApplicationAcknowledgement";
        Response.Redirect("~/Report/Report.aspx");
	}
	protected void fvVendorDetails_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
	{
		fvVendorDetails.ChangeMode(FormViewMode.Edit);
        if (e.Exception == null)
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            Response.Redirect("~/Default.aspx");
        }

        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
	}
	protected void btnHistory_Click(object sender, EventArgs e)
	{
		gvRenewVendor.Visible = false;
		gvRenewHistry.DataBind();
	}
	
}
