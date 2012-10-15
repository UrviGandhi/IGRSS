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

public partial class Registration_Registration : IgrssPage
{
	Guid ValuationId = new Guid();

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
			dr["Religion"] =  new  Guid(ddlReligion.SelectedValue);
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

	protected void btnUpdatePartyDetailsIns_Click(object sender, EventArgs e)
	{

	}
	protected void GvPartyDetailsIns_SelectedIndexChanged(object sender, EventArgs e)
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

		DataTable dtPartyDetails = (DataTable) ViewState["PartyDetails"];

		DropDownList ddlPartyType = ((DropDownList) FvRegistration.FindControl("ddlPartyType" + Mode));
		TextBox txtName = ((TextBox) FvRegistration.FindControl("txtName" + Mode));
		TextBox txtAddress = ((TextBox) FvRegistration.FindControl("txtAddress" + Mode));
		TextBox txtAge = ((TextBox) FvRegistration.FindControl("txtAge" + Mode));

		DropDownList ddlReligion = ((DropDownList) FvRegistration.FindControl("ddlReligion" + Mode));

		TextBox txtOccupation = ((TextBox) FvRegistration.FindControl("txtOccupation" + Mode));

		TextBox txtPAN = ((TextBox) FvRegistration.FindControl("txtPAN" + Mode));


		object[] keys = { RegistrationId };

		DataRow dr = dtPartyDetails.Rows.Find(keys);

		if (null != dr)
		{
			txtName.Text = Convert.ToString(dr["Name"]);
			txtAddress.Text = Convert.ToString(dr["Address"]);
			txtAge.Text = Convert.ToString(dr["Age"]);

			txtOccupation.Text = Convert.ToString(dr["Occupation"]);
			txtPAN.Text = Convert.ToString(dr["PAN"]);


		}
		

		((Button) FvRegistration.FindControl("btnAddPartyDetails" + Mode)).Visible = false;
		((Button) FvRegistration.FindControl("btnUpdatePartyDetails" + Mode)).Visible = true;

		}

	protected void GvPartyDetailsIns_RowDeleting(object sender, GridViewDeleteEventArgs e)
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

	protected void btnValuationForm_Click(object sender, EventArgs e)
	{
		MvRegistration.SetActiveView(MvRegistration.Views[1]);

		FvValuationForm.ChangeMode(FormViewMode.Insert);
	}
	protected void FvRegistration_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, Registration.GetInputSheetRow());
		DataTable dtPartyDetails = (DataTable) ViewState["PartyDetails"];
		e.Values.Add("PartyDetails", dtPartyDetails);
		//string ID = "12b7a44f-61b3-48af-ab91-a6bf83a2d42a";
		e.Values.Add("Id", ValuationId);
		DataTable dtFeeDetails = (DataTable) ViewState["FeeDetails"];
		DataTable dtDocDetails = (DataTable) ViewState["DocDetails"];
		e.Values.Add("FeeDetails", dtFeeDetails);
		e.Values.Add("DocDetails", dtDocDetails);
        //Code Added By Akhilesh.
        FileManagement_FileForward ffc = (FileManagement_FileForward)FvRegistration.FindControl("FileForward1");
        Remarks rem = new Remarks();
        rem.Subject = ((TextBox)ffc.FindControl("txtRemarkSubject")).Text;
        rem.Body = ((TextBox)ffc.FindControl("txtRemarkBody")).Text;
        e.Values.Add("rem", rem);
	}
	protected void odsRegistration_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{

		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

	}

	protected void FvValuationForm_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, AdjudicationRequest.GetValuationFormRow());

		//string ID = "12b7a44f-61b3-48af-ab91-a6bf83a2d42a";

		e.Values.Add("Id",ValuationId);


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
		object[] keys = {new Guid(ddlFees.SelectedValue) };
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
		object[] keys = {  new Guid(ddlDoc.SelectedValue) };
		DataRow dr = dtDocDetails.Rows.Find(keys);

		if (null == dr)
		{
			dr = dtDocDetails.NewRow();
			dr["RegistrationId"] = RegistrationId;
			dr["DocumentTypeId"] = new Guid(ddlDoc.SelectedValue);
			//dr["DocName"] = ddlDoc.SelectedItem.Text;
			dr["DocumentNumber"] = txtDocNumber.Text;
			//dr["Remarks"] = txtDocRemarks.Text; Commented By Akhilesh as FFC is being used for Remarks.
			dr["Submitted"] = chkSubmitted.Checked;
			dtDocDetails.Rows.Add(dr);
			ddlDoc.SelectedIndex = -1;
		}

		((Button) FvRegistration.FindControl("btnAddDocument" + Mode)).Visible = true;
	//	((Button) FvRegistration.FindControl("btnUpdateFeeDetails" + Mode)).Visible = false;

		ViewState["DocDetails"] = dtDocDetails;
		gvDocDetails.DataSource = (DataTable) ViewState["DocDetails"];
		gvDocDetails.DataBind();
		txtDocNumber.Text = "";
        //txtDocRemarks.Text = ""; Commented By Akhilesh as FFC is being used for Remarks.
		chkSubmitted.Checked = false;

	}
	
	
	protected void ddlTypeOfPropertyIns_SelectedIndexChanged(object sender, EventArgs e)
	{
		String PropertyType = ((DropDownList) FvValuationForm.FindControl("ddlTypeOfPropertyIns")).SelectedItem.Text;
		switch (PropertyType)
		{
			case "Residencial":
				{
					MultiView mvR = ((MultiView) FvValuationForm.FindControl("mvPropertyDetailsIns"));
					mvR.SetActiveView(mvR.Views[0]);
					break;
				}
			case "Commercial":
				{
					MultiView mvC = ((MultiView) FvValuationForm.FindControl("mvPropertyDetailsIns"));
					mvC.SetActiveView(mvC.Views[1]);
					break;
				}
			case "Industrial":
				{

					MultiView mvi = ((MultiView) FvValuationForm.FindControl("mvPropertyDetailsIns"));
					mvi.SetActiveView(mvi.Views[2]);
					break;
				}

		}
	}



	protected void odsValuationForm_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}

	protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
	{
		ValuationId = Guid.NewGuid();
		FvValuationForm.InsertItem(true);
		FvRegistration.InsertItem(true);
	}
	protected void gvFeeStampDetailsIns_RowDeleting(object sender, GridViewDeleteEventArgs e)
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
	protected void gvDocumentIns_RowDeleting(object sender, GridViewDeleteEventArgs e)
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
		((Button) FvRegistration.FindControl("btnUpdateDocument" + Mode)).Visible = false;
	}
}
