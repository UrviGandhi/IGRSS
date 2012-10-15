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
using System.Collections.Generic;
using Resources;
public partial class License_LicenseApproval : IgrssPage
{
	LicenseApplication objLicApproved = new LicenseApplication();
	protected void Page_Load(object sender, EventArgs e)
	{
        if (Request.Params["AlertId"] != null)
        {
            IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
            fldApplicationId.Value = alert.SessionData["FileId"].ToString();
            ViewState["AlertId"] = alert.AlertId;
        }
        mvLicApprove.SetActiveView(mvLicApprove.Views[1]);
        fvVendorDetails.ChangeMode(FormViewMode.ReadOnly);

	}
	protected void btnSearchAppNo_Click(object sender, EventArgs e)
	{
		grdVen_Dtl.DataSource = objLicApproved.GetvendordetailByAppNumber(txtApplicationNo.Text);
		grdVen_Dtl.DataBind();
	}
	protected void grdVen_Dtl_SelectedIndexChanged(object sender, EventArgs e)
	{
		mvLicApprove.SetActiveView(mvLicApprove.Views[1]);
		fvVendorDetails.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void fvVendorDetails_ItemCommand(object sender, FormViewCommandEventArgs e)
	{
		if (e.CommandName == "ApproveVendorLicense")
		{
			Guid licID = new Guid(fldApplicationId.Value);
			string LicenseNo = ((TextBox) fvVendorDetails.FindControl("txtLicNo")).Text;
			string IssueDate = ((TextBox) fvVendorDetails.FindControl("txtIssueDate")).Text;
			string EffectiveDate = ((TextBox) fvVendorDetails.FindControl("txtEffectiveDate")).Text;
			string ExpiryDate = ((TextBox) fvVendorDetails.FindControl("txtExpiryDate")).Text;
            Guid AlertId = (Guid) ViewState["AlertId"];
            objLicApproved.ApprovedVendorLicense(licID, LicenseNo, Convert.ToDateTime(IssueDate), Convert.ToDateTime(EffectiveDate), Convert.ToDateTime(ExpiryDate), AlertId);
			mvLicApprove.SetActiveView(mvLicApprove.Views[0]);
			txtApplicationNo.Text = "";
            Dictionary<string, string> reportParams = new Dictionary<string, string>();
            string ApplnNo=((TextBox)fvVendorDetails.FindControl("ApplnNumberTextBox")).Text;
            reportParams.Add("ApplnNumber", ApplnNo);
            Session["ReportParams"] = reportParams;
            Session["ReportName"] = "LicenseApplicationAcknowledgement";
            Response.Redirect("~/Report/Report.aspx");
		}
		if (e.CommandName == "RejectVendorLicense")
		{
			//Guid licID = new Guid(grdVen_Dtl.SelectedDataKey.Value.ToString());
            Guid licID = new Guid(fldApplicationId.Value);
			objLicApproved.RejectVenorLicense(licID);
			mvLicApprove.SetActiveView(mvLicApprove.Views[0]);
			txtApplicationNo.Text = "";
            WorkflowSupport.DeleteAlert(new Guid(ViewState["AlertId"].ToString()));
            ((IGRSS_Default)this.Master).ShowStatusMessage("Application Rejected", "The Application has been rejeced", MessageType.Success);
		}
	}

	protected void btnNewRegistarton_Click(object sender, EventArgs e)
	{
		fvVendorDetails.ChangeMode(FormViewMode.Insert);


	}
	protected void DateOfBirthTextBox_DataBinding(object sender, EventArgs e)
	{
		//TextBox txt = (TextBox) fvReadonly.FindControl("txtModifiedAt");
		//if (txt.Text != "")
		//txt.Text = txt.Text.Remove(10);
	}

	protected void grdVen_Dtl_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		grdVen_Dtl.PageIndex = e.NewPageIndex;
		grdVen_Dtl.DataBind();

	}
	protected void grdVen_Dtl_SelectedIndexChanged1(object sender, EventArgs e)
	{
		mvLicApprove.SetActiveView(mvLicApprove.Views[1]);
		fvVendorDetails.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void InsertButton_Click(object sender, EventArgs e)
	{

	}
    protected void ffcLicenseApproval_Load(object sender, EventArgs e)
    {
        if (fldApplicationId.Value != String.Empty)
        {
            ((FileManagement_FileForward)sender).FileId = new Guid(fldApplicationId.Value);
        }
        else
        {
            ((FileManagement_FileForward)sender).FileId = Guid.Empty;
        }
    }
    protected void fvVendorDetails_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
}
