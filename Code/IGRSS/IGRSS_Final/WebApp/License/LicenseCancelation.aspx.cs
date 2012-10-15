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
using Resources;

public partial class License_LicenseCancelation : IgrssPage
{
	LicenseMasterBLL CancelLicense = new LicenseMasterBLL();
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void fvLicenseNoDtl_ItemCommand(object sender, FormViewCommandEventArgs e)
	{
        if (e.CommandName == "CancelLicense")
        {
            CancelLicense.CancelVendorLicenses(Session["appNo"].ToString());
            mvCancelLicense.SetActiveView(mvCancelLicense.Views[0]);
            txtLicenseNo.Text = "";
            ((IGRSS_Default)this.Master).ShowStatusMessage("License Cancelled", "The License has been Cancelled", MessageType.Success);
            mvCancelLicense.SetActiveView(mvCancelLicense.Views[0]);
            grdLicense.DataBind();
        }
	}

	protected void fvLicenseNoDtl_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	}
	protected void grdLicense_SelectedIndexChanged(object sender, EventArgs e)
	{
        Session["appNo"] = grdLicense.Rows[grdLicense.SelectedIndex].Cells[0].Text;
		mvCancelLicense.SetActiveView(mvCancelLicense.Views[1]);

	}
}