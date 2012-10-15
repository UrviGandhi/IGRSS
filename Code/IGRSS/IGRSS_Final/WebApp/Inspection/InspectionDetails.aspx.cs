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


public partial class Inspection_InspectionDetails : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	
	protected void btnChecklistAddIns_Click(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid InspectionId = Guid.Empty;
		if (null == ViewState["InspectionCheckListDetails"])
		{
			ViewState["InspectionCheckListDetails"] = new Inspection().GetInspectionCheckListById(Guid.Empty);
			InspectionId = Guid.Empty;
		}
		if (FvInspectionDetails.CurrentMode == FormViewMode.Edit)
		{
			InspectionId = (Guid) FvInspectionDetails.DataKey["InspectionId"];

			Mode = "Upd";
		}

		GridView GvInspectionCheckList = ((GridView) FvInspectionDetails.FindControl("GvInspectionCheckList" + Mode));
		DataTable dtInspectionCheckListDetails= (DataTable) ViewState["InspectionCheckListDetails"];
		DropDownList ddlInspectionCheckListId = ((DropDownList) FvInspectionDetails.FindControl("ddlInspectionCheckListId" + Mode));
		CheckBox chkbxChecked = (CheckBox) FvInspectionDetails.FindControl("chkbxChecked" + Mode);
		TextBox txtCheckListRemarks = (TextBox) FvInspectionDetails.FindControl("txtCheckListRemarks" + Mode);
		DataRow dr = dtInspectionCheckListDetails.NewRow();
		dr["InspectionId"] = Guid.Empty;
		dr["InspectionCheckListId"] = ddlInspectionCheckListId.SelectedItem.Value;

		dr["Checked"] = (bool)(chkbxChecked.Checked);

		dr["Remarks"] = txtCheckListRemarks.Text;
		dtInspectionCheckListDetails.Rows.Add(dr);
		ViewState["InspectionCheckListDetails"] = dtInspectionCheckListDetails;
		GvInspectionCheckList.DataSource = (DataTable) ViewState["InspectionCheckListDetails"];
		GvInspectionCheckList.DataBind();

	}

	protected void GvInspectionCheckListIns_SelectedIndexChanged(object sender, EventArgs e)
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
		if (FvInspectionDetails.CurrentMode == FormViewMode.Edit)
		{
			InspectionId = (Guid) FvInspectionDetails.DataKey["InspectionId"];

			Mode = "Upd";
		}

		GridView GvInspectionQueries = ((GridView) FvInspectionDetails.FindControl("GvInspectionQueries" + Mode));
		DataTable dtInspectionQueryListDetails = (DataTable) ViewState["InspectionQueryListDetails"];
		DropDownList ddlCheckListId = ((DropDownList) FvInspectionDetails.FindControl("ddlCheckListId" + Mode));
		TextBox txtQuery = (TextBox) FvInspectionDetails.FindControl("txtQuery" + Mode);
		TextBox txtQueryRemarks = (TextBox) FvInspectionDetails.FindControl("txtQueryRemarks" + Mode);

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


	}



	protected void GvInspectionQueriesIns_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{

		string Mode = "Ins";
		Guid InspectionId = Guid.Empty;
		if (null == ViewState["InspectionCheckListDetails"])
		{
			ViewState["InspectionCheckListDetails"] = new Inspection().GetInspectionCheckListById(Guid.Empty);
			InspectionId = Guid.Empty;
		}
		if (FvInspectionDetails.CurrentMode == FormViewMode.Edit)
		{
			InspectionId = (Guid) FvInspectionDetails.DataKey["InspectionId"];

			Mode = "Upd";
		}

		GridView GvInspectionCheckList = (GridView) sender;
		DataTable dtInspectionCheckListDetails = (DataTable) ViewState["InspectionCheckListDetails"];
		int i = e.RowIndex;
		dtInspectionCheckListDetails.Rows[i].Delete();
		dtInspectionCheckListDetails.AcceptChanges();

		ViewState["InspectionCheckListDetails"] = dtInspectionCheckListDetails;
		GvInspectionCheckList.DataSource = ViewState["InspectionCheckListDetails"];
		GvInspectionCheckList.DataBind();


	}
	protected void FvInspectionDetails_DataBinding(object sender, EventArgs e)
	{
		//Inspection Insp=new Inspection();
		//DataTable dt= new DataTable();
		
		//dt=Insp.GetXmlData();
		//Label lbl = new Label();
		//TextBox txt1 = new TextBox();
		//TextBox txt2 = new TextBox();
		//lbl.Text = (string) dt.Rows[0][0];
		//txt1.Text = (string) dt.Rows[0][1];
		//txt2.Text = (string) dt.Rows[0][2];
		//FvInspectionDetails.Controls.Add(lbl);
		//FvInspectionDetails.Controls.Add(txt1);
		//FvInspectionDetails.Controls.Add(txt2);


	}


}
