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
using System.Xml;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using System.Collections.Generic;
using CheckListInspectionTable = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionDataTable;
using CheckListInspectionRow = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionRow;

using InspectionDetailsRow = IGRSS.DataAccessLayer.InspectionDetails.InspectionDetailsRow;

public partial class Inspection_InspectionWizard : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{



	}

	protected void WzInspection_FinishButtonClick(object sender, WizardNavigationEventArgs e)
	{
		Inspection objInspection = new Inspection();

		InspectionDetailsRow InspectionDetails = Inspection.GetInspectionDetailsRow();
		InspectionDetails.InspectionTypeId = new Guid(ddlInspectionTypeIdIns.SelectedValue);
		InspectionDetails.InspectingOfficerId = new Guid(ddlInspectingOfficerIdIns.SelectedValue);
		InspectionDetails.InspectorOfficeName = txtInspectorOfficeNameIns.Text;
		InspectionDetails.InspectedOfficeId = new Guid(ddlInspectedOfficeIdIns.SelectedValue);
		InspectionDetails.LicenseId = new Guid(ddlLicenseIdIns.SelectedValue);
		InspectionDetails.IsDiscrepancyFound = chkIsDiscrepancyFoundIns.Checked;
		InspectionDetails.Remarks = txtInspectionRemarksIns.Text;

		Wizard Container = (Wizard) Master.FindControl("Main").FindControl("WzInspection");
		List<CheckListInspectionRow> CheckListRows = new List<CheckListInspectionRow>();

        string filename = Server.MapPath("~\\Inspection\\InspectionCheckList.xml");

		XmlDocument InspectionCheckListXml = new XmlDocument();
		InspectionCheckListXml.Load(filename);

        foreach (XmlNode Node in InspectionCheckListXml.SelectNodes("DocumentElement/Page/Items"))
		{
			CheckListInspectionRow CheckListRow = Inspection.GetCheckListRow();
			TextBox txtRemarks = (TextBox) Container.FindControl("txt" + Node.Attributes["ItemId"].Value);
			CheckBox chkYesNo = (CheckBox) Container.FindControl("chk" + Node.Attributes["ItemId"].Value);

			CheckListRow.InspectionCheckListId = new Guid(Node.Attributes["ItemId"].Value);
			if (null != txtRemarks)
				CheckListRow.Remarks = txtRemarks.Text;
			else
				CheckListRow.SetRemarksNull();

			if (null != chkYesNo)
				CheckListRow.Checked = chkYesNo.Checked;
			else
				CheckListRow.Checked = false;

			CheckListRows.Add(CheckListRow);
		}

		DataTable InspectionQueries = (DataTable) ViewState["InspectionQueryListDetails"];

		//objInspection.AddNewInspection(InspectionDetails, CheckListRows, InspectionQueries);
	}

	protected void WzInspection_NextButtonClick(object sender, WizardNavigationEventArgs e)
	{

		//if (WzInspection.ActiveStepIndex == 1)
		//{
		//    WzInspection.ActiveStepIndex = 2;
		//}
		////WzInspection.ActiveStepIndex = 2;

	}

	protected void WzInspection_Init(object sender, EventArgs e)
	{

        string filename = Server.MapPath("~\\Inspection\\InspectionCheckList.xml");
		
		
		XmlDocument doc = new XmlDocument();
		doc.Load(filename);

		Wizard ctrl = (Wizard) Master.FindControl("Main").FindControl("WzInspection");


		foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Page"))
		{
			    WizardStep step = new WizardStep();
				Table tbl = new Table();
				tbl.Style.Add("text-align", "left");
				tbl.BorderWidth = 2;

			foreach (XmlNode PageNode in Node.SelectNodes("Items"))
			{
				//ContentPlaceHolder ctplace = new ContentPlaceHolder();
            	TableRow tr = new TableRow();
				tr.ID = PageNode.Attributes["ItemId"].Value;
				TableCell tdSlNo = new TableCell();
				TableCell tdDesc = new TableCell();
				TableCell tdItem = new TableCell();

				Label lblSlNo = new Label();
				Label lblDesc = new Label();

				tdItem.ID = "itm" + PageNode.Attributes["SlNo"].Value;

				//lblDesc.ID = "lbl" + Node.Attributes["Description"].Value;
				lblSlNo.Text = PageNode.Attributes["SlNo"].Value;
				lblDesc.Text = PageNode.InnerText;

				tdSlNo.Controls.Add(lblSlNo);
				tdDesc.Controls.Add(lblDesc);

				TextBox txtRem = new TextBox();
				CheckBox chkRem = new CheckBox();

				txtRem.ID = "txt" + PageNode.Attributes["ItemId"].Value;
				chkRem.ID = "chk" + PageNode.Attributes["ItemId"].Value;

				switch (PageNode.Attributes["Type"].Value)
				{
					case "1":
						tdItem.Controls.Add(txtRem);
						break;
					case "2":
						tdItem.Controls.Add(chkRem);
						break;
					case "3":
						tdItem.Controls.Add(txtRem);
						tdItem.Controls.Add(chkRem);
						break;
					default:
						break;
				}
				tr.Cells.Add(tdSlNo);
				tr.Cells.Add(tdDesc);
				tr.Cells.Add(tdItem);

				tbl.Rows.Add(tr);
			}
			step.Controls.Add(tbl);

			WzInspection.WizardSteps.AddAt(WzInspection.WizardSteps.Count-1, step);

		}

	}
	protected void WzInspection_ActiveStepChanged(object sender, EventArgs e)
	{

	}
	protected void OdsOffice_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
	{

	}
	protected void btnQueryAddIns_Click(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid InspectionId = Guid.Empty;
		if (null == ViewState["InspectionQueryListDetails"])
		{
			ViewState["InspectionQueryListDetails"] = new Inspection().GetInspectionQueriesByInspectionId(Guid.Empty);
			InspectionId = Guid.Empty;
		}
		GridView GvInspectionQueries = ((GridView) WzInspection.FindControl("GvInspectionQueries" + Mode));
		DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];
		DropDownList ddlCheckListId = ((DropDownList) WzInspection.FindControl("ddlCheckListId" + Mode));
		TextBox txtQuery = (TextBox) WzInspection.FindControl("txtQuery" + Mode);
		TextBox txtQueryRemarks = (TextBox) WzInspection.FindControl("txtQueryRemarks" + Mode);

		DataRow dr = dtInspectionQueryListDetails.NewRow();
		dr["QueryId"] = Guid.NewGuid();
		dr["InspectionId"] = Guid.Empty;
		dr["CheckListId"] = ddlCheckListId.SelectedItem.Value;
		dr["Description"] = ddlCheckListId.SelectedItem.Text;

		dr["Query"] = txtQuery.Text;
		dr["Remarks"] = txtQueryRemarks.Text;

		dtInspectionQueryListDetails.Rows.Add(dr);
		ViewState["InspectionQueryListDetails"] = dtInspectionQueryListDetails;
		GvInspectionQueries.DataSource = (DataTable) ViewState["InspectionQueryListDetails"];
		GvInspectionQueries.DataBind();
		txtQuery.Text = "";
		txtQueryRemarks.Text = "";

	}
	protected void GvInspectionQueriesIns_SelectedIndexChanged(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid InspectionId = Guid.Empty;
		if (null == ViewState["InspectionQueryListDetails"])
		{
			ViewState["InspectionQueryListDetails"] = new Inspection().GetInspectionQueriesByInspectionId(Guid.Empty);
			InspectionId = Guid.Empty;
		}


		GridView GvInspectionQueries = ((GridView) WzInspection.FindControl("GvInspectionQueries" + Mode));

		DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];

		DropDownList ddlCheckListId = ((DropDownList) WzInspection.FindControl("ddlCheckListId" + Mode));
		TextBox txtQuery = ((TextBox) WzInspection.FindControl("txtQuery" + Mode));
		TextBox txtQueryRemarks = ((TextBox) WzInspection.FindControl("txtQueryRemarks" + Mode));

		object[] keys = { GvInspectionQueries.SelectedDataKey.Value };

		DataRow dr = dtInspectionQueryListDetails.Rows.Find(keys);

		if (null != dr)
		{
			ddlCheckListId.SelectedValue = Convert.ToString(dr["CheckListId"]);

			txtQuery.Text = Convert.ToString(dr["Query"]);

			txtQueryRemarks.Text = Convert.ToString(dr["Remarks"]);

		}

		((Button) WzInspection.FindControl("btnQueryAdd" + Mode)).Visible = false;
		((Button) WzInspection.FindControl("btnQueryUpdate" + Mode)).Visible = true;



	}
	protected void GvInspectionQueriesIns_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		Guid InspectionId = Guid.Empty;
		if (null == ViewState["InspectionQueryListDetails"])
		{
			ViewState["InspectionQueryListDetails"] = new Inspection().GetInspectionQueriesByInspectionId(Guid.Empty);
			InspectionId = Guid.Empty;
		}

		GridView GvInspectionQueries = (GridView) sender;
		DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];
		int i = e.RowIndex;
		dtInspectionQueryListDetails.Rows[i].Delete();
		dtInspectionQueryListDetails.AcceptChanges();

		ViewState["InspectionQueryListDetails"] = dtInspectionQueryListDetails;
		GvInspectionQueries.DataSource = ViewState["InspectionQueryListDetails"];
		GvInspectionQueries.DataBind();

	}
	protected void btnQueryUpdateIns_Click(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid InspectionId = Guid.Empty;
		if (null == ViewState["InspectionQueryListDetails"])
		{
			ViewState["InspectionQueryListDetails"] = new Inspection().GetInspectionQueriesByInspectionId(Guid.Empty);
			InspectionId = Guid.Empty;
		}


		GridView GvInspectionQueries = ((GridView) WzInspection.FindControl("GvInspectionQueries" + Mode));
		DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];

		DropDownList ddlCheckListId = ((DropDownList) WzInspection.FindControl("ddlCheckListId" + Mode));
		TextBox txtQuery = ((TextBox) WzInspection.FindControl("txtQuery" + Mode));
		TextBox txtQueryRemarks = ((TextBox) WzInspection.FindControl("txtQueryRemarks" + Mode));
		object[] keys = { GvInspectionQueries.SelectedDataKey.Value };

		DataRow dr = dtInspectionQueryListDetails.Rows.Find(keys);
		if (null != dr)
		{
			dr["CheckListId"] = ddlCheckListId.SelectedValue;
			dr["Query"] = txtQuery.Text;
			dr["Remarks"] = txtQueryRemarks.Text;

		}

		((Button) WzInspection.FindControl("btnQueryAdd" + Mode)).Visible = true;
		((Button) WzInspection.FindControl("btnQueryUpdate" + Mode)).Visible = false;

		GvInspectionQueries.DataSource = (DataTable) ViewState["InspectionQueryListDetails"];
		GvInspectionQueries.DataBind();
		GvInspectionQueries.SelectedIndex = -1;

		txtQuery.Text = "";
		txtQueryRemarks.Text = "";

	}
	protected void WzInspection_DataBinding(object sender, EventArgs e)
	{
		GridView GvInspectionDetails = ((GridView) mvInspectionDetails.FindControl("GvInspectionDetails"));
		Guid InspectionId = (Guid) GvInspectionDetails.SelectedDataKey.Value;
		Inspection objInspection = new Inspection();
		DataTable dtInspectionDetails = new DataTable();
		//dtInspectionDetails = objInspection.GetAllInspectionDetailsById(InspectionId);
		txtInspectorOfficeNameUpd.Text = Convert.ToString(dtInspectionDetails.Columns["InspectorOfficeName"]);
		DataTable dtQueries = new DataTable();
		dtQueries = objInspection.GetInspectionQueriesByInspectionId(InspectionId);
		GvInspectionQueriesUpd.DataSource = dtQueries;
		GvInspectionQueriesUpd.DataBind();

	}

	protected void WzInspectionUpd_Init(object sender, EventArgs e)
	{
        string filename = Server.MapPath("~\\Inspection\\InspectionCheckList.xml");
		XmlDocument doc = new XmlDocument();
		doc.Load(filename);

		Wizard ctrl = (Wizard) Master.FindControl("Main").FindControl("WzInspectionUpd");


		Table tbl = new Table();
		tbl.ID = "tblMain";
		tbl.BorderWidth = 2;

		WizardStep step = new WizardStep();

		foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Items"))
		{
			//ContentPlaceHolder ctplace = new ContentPlaceHolder();

			TableRow tr = new TableRow();
			tr.ID = Node.Attributes["ItemId"].Value;
			TableCell tdSlNo = new TableCell();
			TableCell tdDesc = new TableCell();
			TableCell tdItem = new TableCell();

			Label lblSlNo = new Label();
			Label lblDesc = new Label();

			tdItem.ID = "itm" + Node.Attributes["SlNo"].Value;

			//lblDesc.ID = "lbl" + Node.Attributes["Description"].Value;
			lblSlNo.Text = Node.Attributes["SlNo"].Value;
			lblDesc.Text = Node.InnerText;

			tdSlNo.Controls.Add(lblSlNo);
			tdDesc.Controls.Add(lblDesc);

			TextBox txtRem = new TextBox();
			CheckBox chkRem = new CheckBox();

			txtRem.ID = "txt" + Node.Attributes["ItemId"].Value;
			chkRem.ID = "chk" + Node.Attributes["ItemId"].Value;


			switch (Node.Attributes["Type"].Value)
			{
				case "1":
					tdItem.Controls.Add(txtRem);
					break;
				case "2":
					tdItem.Controls.Add(chkRem);
					break;
				case "3":
					tdItem.Controls.Add(txtRem);
					tdItem.Controls.Add(chkRem);
					break;
				default:
					break;
			}
			tr.Cells.Add(tdSlNo);
			tr.Cells.Add(tdDesc);
			tr.Cells.Add(tdItem);

			tbl.Rows.Add(tr);
		}
		step.Controls.Add(tbl);
		WzInspectionUpd.WizardSteps.AddAt(1, step);

	}

	protected void GvInspectionDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		fldSelectedKey.Value = GvInspectionDetails.SelectedDataKey.Value.ToString();
		mvInspectionDetails.SetActiveView(mvInspectionDetails.Views[1]);
		WzInspectionUpd.ActiveStepIndex = 0;
		WzInspectionUpd.DataBind();

	}
	protected void WzInspectionUpd_Load(object sender, EventArgs e)
	{
	}
	protected void WzInspectionUpd_DataBinding(object sender, EventArgs e)
	{
		if (fldSelectedKey.Value != "")
		{
			Guid InspectionId = new Guid(fldSelectedKey.Value);

			Inspection objInspection = new Inspection();
			DataRow drInspectionDetails = objInspection.GetInspectionDetailsById(InspectionId).Rows[0];

			//ddlInspectionTypeIdUpd.DataValueField = ((Guid) drInspectionDetails["InspectionTypeId"]).ToString();
			// ddlInspectingOfficerIdUpd.DataValueField = ((Guid) drInspectionDetails["InspectingOfficerId"]).ToString();

			//ddlInspectionTypeIdUpd.DataTextField = ((Guid) drInspectionDetails["InspectionTypeId"]).ToString();
			//ddlInspectingOfficerIdUpd.DataTextField = ((Guid) drInspectionDetails["InspectingOfficerId"]).ToString();

			//txtInspectorOfficeNameUpd.Text = ((Guid) drInspectionDetails["InspectorOfficeName"]).ToString();
			txtInspectorOfficeNameUpd.Text = Convert.ToString(drInspectionDetails["InspectorOfficeName"]);
			IsdescripancyFoundUpd.Checked = (bool) (drInspectionDetails["IsDiscrepancyFound"]);
			txtInspectionRemarksUpd.Text = Convert.ToString(drInspectionDetails["Remarks"]);

			DataTable dtQueries = new DataTable();

			dtQueries = objInspection.GetInspectionQueriesByInspectionId(InspectionId);

			GvInspectionQueriesUpd.DataSource = dtQueries;
			GvInspectionQueriesUpd.DataBind();

			Wizard Container = (Wizard) Master.FindControl("Main").FindControl("WzInspectionUpd");
			List<CheckListInspectionRow> CheckListRows = new List<CheckListInspectionRow>();

            string filename = Server.MapPath("~\\Inspection\\InspectionCheckList.xml");
			XmlDocument InspectionCheckListXml = new XmlDocument();
			InspectionCheckListXml.Load(filename);

			foreach (XmlNode Node in InspectionCheckListXml.SelectNodes("DocumentElement/Items"))
			{

				CheckListInspectionTable dtChecklist = new CheckListInspectionTable();
				dtChecklist = (CheckListInspectionTable) objInspection.GetInspectionCheckListById(InspectionId);
				CheckListInspectionRow drCheckListRow = Inspection.GetCheckListRow();
				Guid[] keys = { InspectionId, 
								new Guid(Node.Attributes["ItemId"].Value) };
				drCheckListRow = (CheckListInspectionRow) dtChecklist.FindByInspectionIdInspectionCheckListId(keys[0], keys[1]);
				TextBox txtRemarks = (TextBox) Container.FindControl("txt" + Node.Attributes["ItemId"].Value);
				CheckBox chkYesNo = (CheckBox) Container.FindControl("chk" + Node.Attributes["ItemId"].Value);
				if (null != txtRemarks)
				{
					txtRemarks.Text = Convert.ToString(drCheckListRow["Remarks"]);
				}
				if (null != chkYesNo)
				{
					chkYesNo.Checked = (bool) drCheckListRow["Checked"];
				}



			}

		}


	}
	protected void ddlLicenseIdUpd_SelectedIndexChanged(object sender, EventArgs e)
	{

	}
	protected void GvInspectionQueriesUpd_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (fldSelectedKey.Value != "")
		{
			Guid InspectionId = new Guid(fldSelectedKey.Value);
			string Mode = "Upd";

			if (null == ViewState["InspectionQueryListDetails"])
			{
				ViewState["InspectionQueryListDetails"] = new Inspection().GetInspectionQueriesByInspectionId(InspectionId);

			}
			GridView GvInspectionQueries = ((GridView) WzInspectionUpd.FindControl("GvInspectionQueries" + Mode));

			DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];

			DropDownList ddlCheckListId = ((DropDownList) WzInspectionUpd.FindControl("ddlCheckListId" + Mode));
			TextBox txtQuery = ((TextBox) WzInspectionUpd.FindControl("txtQuery" + Mode));
			TextBox txtQueryRemarks = ((TextBox) WzInspectionUpd.FindControl("txtQueryRemarks" + Mode));
			object[] keys = { GvInspectionQueries.SelectedDataKey.Value };

			DataRow dr = dtInspectionQueryListDetails.Rows.Find(keys);

			if (null != dr)
			{
				ddlCheckListId.SelectedValue = Convert.ToString(dr["CheckListId"]);

				txtQuery.Text = Convert.ToString(dr["Query"]);

				txtQueryRemarks.Text = Convert.ToString(dr["Remarks"]);
			}

			((Button) WzInspectionUpd.FindControl("btnQueryAdd" + Mode)).Visible = false;
			((Button) WzInspectionUpd.FindControl("btnQueryUpdate")).Visible = true;

		}

	}
	protected void btnQueryUpdate_Click(object sender, EventArgs e)
	{
		if (fldSelectedKey.Value != "")
		{
			Guid InspectionId = new Guid(fldSelectedKey.Value);
			string Mode = "Upd";

			if (null == ViewState["InspectionQueryListDetails"])
			{
				ViewState["InspectionQueryListDetails"] = new Inspection().GetInspectionQueriesByInspectionId(InspectionId);

			}

			GridView GvInspectionQueries = ((GridView) WzInspectionUpd.FindControl("GvInspectionQueries" + Mode));

			DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];

			DropDownList ddlCheckListId = ((DropDownList) WzInspectionUpd.FindControl("ddlCheckListId" + Mode));
			TextBox txtQuery = ((TextBox) WzInspectionUpd.FindControl("txtQuery" + Mode));
			TextBox txtQueryRemarks = ((TextBox) WzInspectionUpd.FindControl("txtQueryRemarks" + Mode));

			object[] keys = { GvInspectionQueries.SelectedDataKey.Value };

			DataRow dr = dtInspectionQueryListDetails.Rows.Find(keys);
			if (null != dr)
			{
				dr["CheckListId"] = ddlCheckListId.SelectedValue;
				dr["Query"] = txtQuery.Text;
				dr["Remarks"] = txtQueryRemarks.Text;

			}

			((Button) WzInspectionUpd.FindControl("btnQueryAdd" + Mode)).Visible = true;
			((Button) WzInspectionUpd.FindControl("btnQueryUpdate")).Visible = false;

			GvInspectionQueries.DataSource = (DataTable) ViewState["InspectionQueryListDetails"];
			GvInspectionQueries.DataBind();
			GvInspectionQueries.SelectedIndex = -1;

			txtQuery.Text = "";
			txtQueryRemarks.Text = "";

		}
	}
	protected void WzInspectionUpd_FinishButtonClick(object sender, WizardNavigationEventArgs e)
	{

		if (fldSelectedKey.Value != "")
		{
			Guid InspectionId = new Guid(fldSelectedKey.Value);

			Inspection objInspection = new Inspection();

			InspectionDetailsRow InspectionDetails = Inspection.GetInspectionDetailsRow();
			InspectionDetails.InspectionTypeId = new Guid(ddlInspectionTypeIdUpd.SelectedValue);
			InspectionDetails.InspectingOfficerId = new Guid(ddlInspectingOfficerIdUpd.SelectedValue);
			InspectionDetails.InspectorOfficeName = txtInspectorOfficeNameUpd.Text;
			InspectionDetails.InspectedOfficeId = new Guid(ddlInspectedOfficeIdUpd.SelectedValue);
			InspectionDetails.LicenseId = new Guid(ddlLicenseIdUpd.SelectedValue);
			InspectionDetails.IsDiscrepancyFound = IsdescripancyFoundUpd.Checked;
			InspectionDetails.Remarks = txtInspectionRemarksUpd.Text;

			Wizard Container = (Wizard) Master.FindControl("Main").FindControl("WzInspectionUpd");
			List<CheckListInspectionRow> CheckListRows = new List<CheckListInspectionRow>();

            string filename = Server.MapPath("~\\Inspection\\InspectionCheckList.xml");
			XmlDocument InspectionCheckListXml = new XmlDocument();
			InspectionCheckListXml.Load(filename);

			foreach (XmlNode Node in InspectionCheckListXml.SelectNodes("DocumentElement/Items"))
			{
				CheckListInspectionRow CheckListRow = Inspection.GetCheckListRow();
				TextBox txtRemarks = (TextBox) Container.FindControl("txt" + Node.Attributes["ItemId"].Value);
				CheckBox chkYesNo = (CheckBox) Container.FindControl("chk" + Node.Attributes["ItemId"].Value);

				CheckListRow.InspectionCheckListId = new Guid(Node.Attributes["ItemId"].Value);

				if (null != txtRemarks)
					CheckListRow.Remarks = txtRemarks.Text;
				else
					CheckListRow.SetRemarksNull();

				if (null != chkYesNo)
					CheckListRow.Checked = chkYesNo.Checked;
				else
					CheckListRow.Checked = false;

				CheckListRows.Add(CheckListRow);
			}


			DataTable InspectionQueries = (DataTable) ViewState["InspectionQueryListDetails"];

			objInspection.UpdateInspection(InspectionDetails, CheckListRows, InspectionQueries, InspectionId);

		}
	}

	protected void btnQueryAddUpd_Click(object sender, EventArgs e)
	{
		if (fldSelectedKey.Value != "")
		{
			Guid InspectionId = new Guid(fldSelectedKey.Value);
			string Mode = "Upd";

			if (null == ViewState["InspectionQueryListDetails"])
			{
				ViewState["InspectionQueryListDetails"] = new Inspection().GetInspectionQueriesByInspectionId(InspectionId);

			}

			GridView GvInspectionQueries = ((GridView) WzInspectionUpd.FindControl("GvInspectionQueries" + Mode));
			DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];
			DropDownList ddlCheckListId = ((DropDownList) WzInspection.FindControl("ddlCheckListId" + Mode));
			TextBox txtQuery = (TextBox) WzInspection.FindControl("txtQuery" + Mode);
			TextBox txtQueryRemarks = (TextBox) WzInspection.FindControl("txtQueryRemarks" + Mode);

			DataRow dr = dtInspectionQueryListDetails.NewRow();
			dr["QueryId"] = Guid.NewGuid();
			dr["InspectionId"] = Guid.Empty;
			dr["CheckListId"] = ddlCheckListIdUpd.SelectedItem.Value;
			dr["Description"] = ddlCheckListIdUpd.SelectedItem.Text;

			dr["Query"] = txtQueryUpd.Text;
			dr["Remarks"] = txtQueryRemarksUpd.Text;

			dtInspectionQueryListDetails.Rows.Add(dr);
			ViewState["InspectionQueryListDetails"] = dtInspectionQueryListDetails;
			GvInspectionQueriesUpd.DataSource = (DataTable) ViewState["InspectionQueryListDetails"];
			GvInspectionQueriesUpd.DataBind();
			txtQueryUpd.Text = "";
			txtQueryRemarksUpd.Text = "";

		}
	}

	protected void GvInspectionQueriesUpd_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		if (fldSelectedKey.Value != "")
		{
			Guid InspectionId = new Guid(fldSelectedKey.Value);
			string Mode = "Upd";

			if (null == ViewState["InspectionQueryListDetails"])
			{
				ViewState["InspectionQueryListDetails"] = new Inspection().GetInspectionQueriesByInspectionId(InspectionId);

			}

			GridView GvInspectionQueries = (GridView) sender;
			DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];
			int i = e.RowIndex;
			dtInspectionQueryListDetails.Rows[i].Delete();
			dtInspectionQueryListDetails.AcceptChanges();

			ViewState["InspectionQueryListDetails"] = dtInspectionQueryListDetails;
			GvInspectionQueries.DataSource = ViewState["InspectionQueryListDetails"];
			GvInspectionQueries.DataBind();


		}
	}

}
