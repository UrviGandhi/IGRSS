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
using IGRSS.BusinessObjects;
using IGRSS.BusinessLogicLayer;

public partial class Registration_UpdateRegistration : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}


	protected void btnAddPartyDetails_Click(object sender, EventArgs e)
	{

		string Mode = "Ins";
		Guid RegistrationId = Guid.Empty;

		if (null == ViewState["PartyDetails"])
		{

			ViewState["PartyDetails"] = new Registration().GetRegistrationPartyDetailsById(Guid.Empty);

			RegistrationId = Guid.Empty;
		}
		if (FvRegistration.CurrentMode == FormViewMode.Edit)
		{
			RegistrationId = (Guid) FvRegistration.DataKey["RegistrationId"];
			Mode = "Upd";
		}

		GridView GvPartyDetails = ((GridView) FvRegistration.FindControl("GvPartyDetails" + Mode));

		DataTable dtPartyDetails = (DataTable) ViewState["PartyDetails"];
		DropDownList ddlPartyType = ((DropDownList) FvRegistration.FindControl("ddlPartyType" + Mode));
		TextBox txtName = ((TextBox) FvRegistration.FindControl("txtName" + Mode));
		TextBox txtAddress = ((TextBox) FvRegistration.FindControl("txtAddress" + Mode));
		TextBox txtAge = ((TextBox) FvRegistration.FindControl("txtAge" + Mode));

		TextBox txtGender = ((TextBox) FvRegistration.FindControl("txtGender" + Mode));
		DropDownList ddlReligion = ((DropDownList) FvRegistration.FindControl("ddlReligion" + Mode));

		TextBox txtOccupation = ((TextBox) FvRegistration.FindControl("txtOccupation" + Mode));

		TextBox txtPAN = ((TextBox) FvRegistration.FindControl("txtPAN" + Mode));
		object[] keys = { RegistrationId };

		//	object[] keys = { RegistrationId, new Guid(ddlPartyType.SelectedValue) };
		DataRow dr = dtPartyDetails.Rows.Find(keys);
		if (null == dr)
		{
			dr = dtPartyDetails.NewRow();
			dr["RegistrationId"] = RegistrationId;
			dr["PartyType"] = ddlPartyType.SelectedItem.Text;
			dr["Name"] = txtName.Text;
			dr["Address"] = txtAddress.Text;
			dr["Age"] = txtAge.Text;
			dr["PartyID"] = Guid.NewGuid();
			dr["Religion"] = new Guid(ddlReligion.SelectedValue);
			dr["Occupation"] = txtOccupation.Text;
			dr["Gender"] = txtGender.Text;
			dr["PAN"] = txtPAN.Text;

			dtPartyDetails.Rows.Add(dr);
			//ddlPartyType.SelectedIndex = -1;
			//ddlReligion.SelectedIndex = -1;
		}

		ViewState["PartyDetails"] = dtPartyDetails;
		GvPartyDetails.DataSource = (DataTable) ViewState["PartyDetails"];
		GvPartyDetails.DataBind();
		txtName.Text = "";
		txtAddress.Text = "";
		txtAge.Text = "";
		txtOccupation.Text = "";
		txtPAN.Text = "";
		txtGender.Text = "";
		((Button) FvRegistration.FindControl("btnAddPartyDetails" + Mode)).Visible = true;
		((Button) FvRegistration.FindControl("btnUpdatePartyDetails" + Mode)).Visible = false;

	}

	protected void btnUpdatePartyDetails_Click(object sender, EventArgs e)
	{

	}
	protected void GvRegistrationDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[1]);
		FvRegistration.ChangeMode(FormViewMode.Edit);


	}
	protected void FvRegistration_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, Registration.GetInputSheetRow());
		DataTable dtPartyDetails = (DataTable) ViewState["PartyDetails"];

		e.NewValues.Add("PartyDetails", dtPartyDetails);
	}
	protected void odsRegistrationById_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
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
	
	
	protected void FvRegistration_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	}
	protected void btnValuationForm_Click(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[2]);

		FvValuationForm.ChangeMode(FormViewMode.Edit);
	}


	protected void AddFeeDetails_Click(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid RegistrationId = Guid.Empty;
		if (null == ViewState["FeeDetails"])
		{
			ViewState["FeeDetails"] = new Registration().GetRegistrationFeeDetailsById(Guid.Empty);
			RegistrationId = Guid.Empty;
		}
		if (FvRegistration.CurrentMode == FormViewMode.Edit)
		{
			//TODO: Replace the Data Key Name here.
			RegistrationId = (Guid) FvRegistration.DataKey["RegistrationId"];


			Mode = "Upd";
		}
		GridView gvFeeStampDetails = ((GridView) FvRegistration.FindControl("gvFeeStampDetails" + Mode));
		DataTable dtFeesDetails = (DataTable) ViewState["FeeDetails"];
		DropDownList ddlFees = ((DropDownList) FvRegistration.FindControl("ddlFeeType" + Mode));
		TextBox txtAmount = ((TextBox) FvRegistration.FindControl("txtFeeAmount" + Mode));
		object[] keys = { new Guid(ddlFees.SelectedValue) };
		DataRow dr = dtFeesDetails.Rows.Find(keys);
		if (null == dr)
		{
			dr = dtFeesDetails.NewRow();
			dr["RegistrationId"] = RegistrationId;
			dr["FeeId"] = new Guid(ddlFees.SelectedValue);
			//dr["FeeName"] = ddlFees.SelectedItem.Value;
			dr["Amount"] = txtAmount.Text;
			dtFeesDetails.Rows.Add(dr);
			ddlFees.SelectedIndex = -1;
			txtAmount.Text = "";
		}
		((Button) FvRegistration.FindControl("btnAddFeeDetail" + Mode)).Visible = true;
		((Button) FvRegistration.FindControl("btnUpdateFeeDetail" + Mode)).Visible = false;
		ViewState["FeeDetails"] = dtFeesDetails;
		gvFeeStampDetails.DataSource = (DataTable) ViewState["FeeDetails"];
		gvFeeStampDetails.DataBind();
	}

	protected void AddDocumentDetails_Click(object sender, EventArgs e)
	{

		string Mode = "Ins";
		Guid RegistrationId = Guid.Empty;
		if (null == ViewState["DocDetails"])
		{
			ViewState["DocDetails"] = new Registration().GetDocumentDetailsById(Guid.Empty);
			RegistrationId = Guid.Empty;
		}
		if (FvRegistration.CurrentMode == FormViewMode.Edit)
		{
			//TODO: Replace the Data Key Name here.
			RegistrationId = (Guid) FvRegistration.DataKey["RegistrationId"];
			Mode = "Upd";
		}

		GridView gvDocDetails = ((GridView) FvRegistration.FindControl("gvDocument" + Mode));
		DataTable dtDocDetails = (DataTable) ViewState["DocDetails"];
		DropDownList ddlDoc = ((DropDownList) FvRegistration.FindControl("ddlDocumentType" + Mode));
		TextBox txtDocNumber = ((TextBox) FvRegistration.FindControl("txtDocumentNumber" + Mode));
		TextBox txtDocRemarks = ((TextBox) FvRegistration.FindControl("txtDocRemarks" + Mode));
		CheckBox chkSubmitted = ((CheckBox) FvRegistration.FindControl("chkSubmitted" + Mode));
		object[] keys = { new Guid(ddlDoc.SelectedValue) };
		DataRow dr = dtDocDetails.Rows.Find(keys);

		if (null == dr)
		{
			dr = dtDocDetails.NewRow();
			dr["RegistrationId"] = RegistrationId;
			dr["DocumentTypeId"] = new Guid(ddlDoc.SelectedValue);
			//dr["DocName"] = ddlDoc.SelectedItem.Text;
			dr["DocumentNumber"] = txtDocNumber.Text;
			dr["Remarks"] = txtDocRemarks.Text;
			dr["Submitted"] = chkSubmitted.Checked;
			dtDocDetails.Rows.Add(dr);
			ddlDoc.SelectedIndex = -1;
		}

		((Button) FvRegistration.FindControl("btnAddDocument" + Mode)).Visible = true;
		((Button) FvRegistration.FindControl("btnUpdateFeeDetails" + Mode)).Visible = false;

		ViewState["DocDetails"] = dtDocDetails;
		gvDocDetails.DataSource = (DataTable) ViewState["DocDetails"];
		gvDocDetails.DataBind();
		txtDocNumber.Text = "";
		txtDocRemarks.Text = "";
		chkSubmitted.Checked = false;
	

	}



	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[2]);
		FvRegistration.ChangeMode(FormViewMode.Edit);

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


	protected void FvValuationForm_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, AdjudicationRequest.GetValuationFormRow());
	}
	protected void odsValuationForm_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
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

	protected void gvFeeStampDetailsUpd_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{

		string Mode = "Ins";
		Guid RegistrationId = Guid.Empty;

		if (null == ViewState["FeeDetails"])
		{

			ViewState["FeeDetails"] = new Registration().GetRegistrationFeeDetailsById(Guid.Empty);

			RegistrationId = Guid.Empty;
		}
		if (FvRegistration.CurrentMode == FormViewMode.Edit)
		{
			RegistrationId = (Guid) FvRegistration.DataKey["RegistrationId"];
			Mode = "Upd";
		}

		GridView gv = (GridView) sender;
		DataTable dt = (DataTable) ViewState["FeeDetails"];
		int i = e.RowIndex;
		dt.Rows[i].Delete();
		dt.AcceptChanges();
		ViewState["FeeDetails"] = dt;
		gv.DataSource = ViewState["FeeDetails"];
		gv.DataBind();

		((Button) FvRegistration.FindControl("btnAddFeeDetail" + Mode)).Visible = true;
		((Button) FvRegistration.FindControl("btnUpdateFeeDetail" + Mode)).Visible = false;





	}
	protected void gvDocumentUpd_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string Mode = "Ins";
		Guid RegistrationId = Guid.Empty;

		if (null == ViewState["DocDetails"])
		{

			ViewState["DocDetails"] = new Registration().GetDocumentDetailsById(Guid.Empty);

			RegistrationId = Guid.Empty;
		}
		if (FvRegistration.CurrentMode == FormViewMode.Edit)
		{
			RegistrationId = (Guid) FvRegistration.DataKey["RegistrationId"];
			Mode = "Upd";
		}

		GridView gv = (GridView) sender;
		DataTable dt = (DataTable) ViewState["DocDetails"];
		int i = e.RowIndex;
		dt.Rows[i].Delete();
		dt.AcceptChanges();
		ViewState["DocDetails"] = dt;
		gv.DataSource = ViewState["DocDetails"];
		gv.DataBind();

		((Button) FvRegistration.FindControl("btnAddDocument" + Mode)).Visible = true;
		//((Button) FvRegistration.FindControl("btnUpdateDocument" + Mode)).Visible = false;
	}


	protected void GvPartyDetailsUpd_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string Mode = "Ins";
		Guid RegistrationId = Guid.Empty;

		if (null == ViewState["PartyDetails"])
		{

			ViewState["PartyDetails"] = new Registration().GetRegistrationPartyDetailsById(Guid.Empty);

			RegistrationId = Guid.Empty;
		}
		if (FvRegistration.CurrentMode == FormViewMode.Edit)
		{
			RegistrationId = (Guid) FvRegistration.DataKey["RegistrationId"];
			Mode = "Upd";
		}

		GridView gv = (GridView) sender;
		DataTable dt = (DataTable) ViewState["PartyDetails"];
		int i = e.RowIndex;
		dt.Rows[i].Delete();
		dt.AcceptChanges();
		ViewState["PartyDetails"] = dt;
		gv.DataSource = ViewState["PartyDetails"];
		gv.DataBind();

		((Button) FvRegistration.FindControl("btnAddPartyDetails" + Mode)).Visible = true;
		((Button) FvRegistration.FindControl("btnUpdatePartyDetails" + Mode)).Visible = false;
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

	protected void btnHearing_Click(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[3]);

		GridView GvRegistrationHearing = (GridView)MvRegistration.FindControl("GvRegistrationHearing");

		GvRegistrationHearing.DataBind();
		

	}
	protected void odsRegistrationHearingById_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
		//e.InputParameters.Add("RegistrationId", fldRegistrationId);
	}
	protected void FvRegistrationHearing_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, Registration.GetRegistrationHearingRow());
	

	}
}
