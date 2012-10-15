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

public partial class Registration_RegistrationIntegration : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}


	protected void btnHearing_Click(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[3]);

		GridView GvRegistrationHearing = (GridView) MvRegistration.FindControl("GvRegistrationHearing");

		GvRegistrationHearing.DataBind();


	}

	protected void FvRegistrationHearing_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		e.Values.Add("RegistrationId", fldRegistrationId.Value);
		Global.SetFormViewParameters(e.Values, Registration.GetRegistrationHearingRow());
	}

	protected void GvRegistrationDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		fldRegistrationId.Value = ((GridView) sender).SelectedDataKey.Value.ToString();
		MvRegistration.SetActiveView(MvRegistration.Views[1]);
	}


	protected void GvPartyDetailsUpd_DataBinding(object sender, EventArgs e)
	{
		//Registration objRegistration = new Registration();
		//Guid RegistrationId = (Guid) GvRegistrationDetails.SelectedDataKey.Values["RegistrationId"];
		//ViewState["PartyDetails"] = objRegistration.GetRegistrationPartyDetailsById(RegistrationId);
		//GridView GvPartyDetailsUpd = (GridView) FvRegistration.FindControl("GvPartyDetailsUpd");
		//GvPartyDetailsUpd.DataSource = (DataTable) ViewState["PartyDetails"];
		//GvPartyDetailsUpd.SelectedIndex = -1;
		//GvPartyDetailsUpd.DataBind();

	}


	protected void btnValuationForm_Click(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[2]);

		FvValuationForm.ChangeMode(FormViewMode.Edit);
	}


	protected void FvRegistration_DataBound(object sender, EventArgs e)
	{


		if (FvRegistration.CurrentMode == FormViewMode.Edit)
		{
			Registration objRegistration = new Registration();
			Guid RegistrationId = (Guid) GvRegistrationDetails.SelectedDataKey.Values["RegistrationId"];
			ViewState["PartyDetails"] = objRegistration.GetRegistrationPartyDetailsById(RegistrationId);
			GridView grd = (GridView) FvRegistration.FindControl("GvPartyDetailsUpd");

			grd.DataSource = (DataTable) ViewState["PartyDetails"];
			grd.SelectedIndex = -1;
			grd.DataBind();

			ViewState["FeeDetails"] = new Registration().GetRegistrationFeeDetailsById(RegistrationId);
			GridView Gv = ((GridView) FvRegistration.FindControl("gvFeeStampDetailsUpd"));
			Gv.DataSource = ViewState["FeeDetails"];
			Gv.DataBind();
			ViewState["DocDetails"] = new Registration().GetDocumentDetailsById(RegistrationId);
			GridView GvDocDetails = ((GridView) FvRegistration.FindControl("gvDocumentUpd"));
			GvDocDetails.DataSource = ViewState["DocDetails"];
			GvDocDetails.DataBind();


		}
	}


	protected void ddlTypeOfPropertyUpd_DataBound(object sender, EventArgs e)
	{
		String PropertyType = ((DropDownList) FvValuationForm.FindControl("ddlTypeOfPropertyUpd")).SelectedItem.Text;
		switch (PropertyType)
		{
			case "Residencial":
				{
					MultiView mvR = ((MultiView) FvValuationForm.FindControl("mvPropertyDetailsUpd"));
					mvR.SetActiveView(mvR.Views[0]);
					break;
				}
			case "Commercial":
				{
					MultiView mvC = ((MultiView) FvValuationForm.FindControl("mvPropertyDetailsUpd"));
					mvC.SetActiveView(mvC.Views[1]);
					break;
				}
			case "Industrial":
				{

					MultiView mvi = ((MultiView) FvValuationForm.FindControl("mvPropertyDetailsUpd"));
					mvi.SetActiveView(mvi.Views[2]);
					break;
				}

		}

		

	}


	protected void BtnBackToGrid_Click(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[0]);

	}



	protected void GvRegistrationHearing_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[3]);
		// FvRegistrationHearing.ChangeMode(FormViewMode.Insert);


	}


	protected void odsRegistrationById_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}

	protected void odsValuationForm_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}

	protected void odsRegistrationHearingById_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	//	e.InputParameters.Add("RegistrationId", fldRegistrationId);

	}
}
