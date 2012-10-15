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

public partial class Inspection_InspectionMemo : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void btnSearch_Click(object sender, EventArgs e)
	{
		Inspection objinspection= new Inspection();

		GvInspectionMemo.DataSource = objinspection.SearchInspectionDetails(txtInspectionNo.Text);
		GvInspectionMemo.DataBind();

	}
	protected void GvInspectionMemo_SelectedIndexChanged(object sender, EventArgs e)
	{

		fldInspectionId.Value = ((GridView) sender).SelectedDataKey.Value.ToString();

		MvInspectionMemo.SetActiveView(MvInspectionMemo.Views[1]);
		FvInspectionDetailsItm.ChangeMode(FormViewMode.ReadOnly);
		fvMemo.ChangeMode(FormViewMode.Insert);
		
		mvMemoDetails.SetActiveView(mvMemoDetails.Views[0]);

	}
	//protected void btnAdd_Click(object sender, EventArgs e)
	//{
	    
	//    string Mode = "Ins";

	//    Guid InspectionId = Guid.Empty;
		

	//    if (null == ViewState["MemoDetails"])
	//    {
	//        ViewState["MemoDetails"] = new Inspection().GetInspectionMemoById(InspectionId);
	//        InspectionId = Guid.Empty;
	//    }

	//    //GridView gvInspectionMemo = ((GridView) fvMemo.FindControl("GvInspectionMemoDetails" + Mode));
	//    DataTable dtMemoDetails = (DataTable) ViewState["MemoDetails"];

	//    TextBox txtSubject = ((TextBox) fvMemo.FindControl("txtSubject" + Mode));
	//    TextBox txtMemoDate = ((TextBox) fvMemo.FindControl("txtMemoDate" + Mode));
	//    TextBox txtMemoBody = ((TextBox) fvMemo.FindControl("txtMemoBody" + Mode));

	//    DataRow dr = dtMemoDetails.Rows.Find(InspectionId);

		
	//    if (null == dr)
	//    {
	//        dr = dtMemoDetails.NewRow();
	//        dr["InspectionMemoId"] = Guid.NewGuid();

	//        dr["Subject"] = txtSubject.Text;
	//        dr["MemoDate"] = txtMemoDate.Text.ToString();
	//        dr["MemoBody"] = txtMemoBody.Text;
	//        //dr["MemoDate"] = txtMemoDate.

	//        dr["InspectionId"] = InspectionId;
	//        dtMemoDetails.Rows.Add(dr);
			
	//    }

	//    txtSubject.Text = "";
	//    txtMemoDate.Text = "";
	//    txtMemoBody.Text = "";
		
	//    ViewState["MemoDetails"] = dtMemoDetails;
		
	//    gvMemo.DataSource = (DataTable) ViewState["MemoDetails"];
	//    gvMemo.DataBind();

	//    ((Button) fvMemo.FindControl("btnAdd")).Visible = true;
	//    ((Button) fvMemo.FindControl("btnUpdate")).Visible = false;
	//    mvMemoDetails.SetActiveView(mvMemoDetails.Views[0]);


	//}
	protected void GvInspectionMemoDetailsIns_SelectedIndexChanged(object sender, EventArgs e)
	{
		//string Mode = "Ins";
		//Guid InspectionId = Guid.Empty;
		//if (null == ViewState["MemoDetails"])
		//{
		//    ViewState["MemoDetails"] = new Inspection().GetInspectionMemoById(Guid.Empty);
		//    InspectionId = Guid.Empty;
		//}
		//if (fvMemo.CurrentMode == FormViewMode.Edit)
		//{
		//    InspectionId = (Guid) fvMemo.DataKey["InspectionId"];
		//    Mode = "Upd";
		//}
		////GridView GvInspectionMemoDetailsIns = (GridView) sender;
		//DataTable MemoDetails = (DataTable) ViewState["MemoDetails"];

		//TextBox txtSubject = ((TextBox) fvMemo.FindControl("txtSubject" + Mode));
		//TextBox txtMemoDate = ((TextBox) fvMemo.FindControl("txtMemoDate" + Mode));
		//TextBox txtMemoBody = ((TextBox) fvMemo.FindControl("txtMemoBody" + Mode));


		//object[] keys = new object[gvMemo.SelectedDataKey.Values.Count];
		//for (int i = 0; i < keys.Length; i++)
		//{
		//    keys[i] = gvMemo.SelectedDataKey.Values[i];
		//}
		//DataRow dr = MemoDetails.Rows.Find(keys);

		//if (null != dr)
		//{

		//    txtSubject.Text = Convert.ToString(dr["Subject"]);

		//    txtMemoDate.Text = Convert.ToString(dr["MemoDate"]);

		//    txtMemoBody.Text = Convert.ToString(dr["Subject"]);
		//}


		//((Button) fvMemo.FindControl("btnAdd")).Visible = false;
		//((Button) fvMemo.FindControl("btnUpdate")).Visible = true;


		fldInspectionMemoId.Value = ((GridView) sender).SelectedDataKey.Value.ToString();

		mvMemoActionTaken.SetActiveView(mvMemoActionTaken.Views[1]);

		fvActionTaken.ChangeMode(FormViewMode.Insert);

	}
	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid InspectionId = Guid.Empty;
		if (null == ViewState["MemoDetails"])
		{
			ViewState["MemoDetails"] = new Inspection().GetInspectionMemoById(Guid.Empty);
			InspectionId = Guid.Empty;
		}
		if (fvMemo.CurrentMode == FormViewMode.Edit)
		{
			InspectionId = (Guid) fvMemo.DataKey["InspectionId"];
			Mode = "Upd";
		}

	//	GridView GvInspectionMemoDetailsIns = (GridView) sender;
		

		DataTable dtMemoDetails = (DataTable) ViewState["MemoDetails"];

		TextBox txtSubject = ((TextBox) fvMemo.FindControl("txtSubject" + Mode));
		TextBox txtMemoDate = ((TextBox) fvMemo.FindControl("txtMemoDate" + Mode));
		TextBox txtMemoBody = ((TextBox) fvMemo.FindControl("txtMemoBody" + Mode));

		object[] keys = new object[gvMemo.SelectedDataKey.Values.Count];
		for (int i = 0; i < keys.Length; i++)
		{
			keys[i] = gvMemo.SelectedDataKey.Values[i];
		}
		DataRow dr = dtMemoDetails.Rows.Find(keys);

		if (null != dr)
		{
	     dr["InspectionMemoId"] = Guid.NewGuid();

		dr["Subject"] = txtSubject.Text;
		dr["MemoDate"] = txtMemoDate.Text.ToString();
		dr["MemoBody"] = txtMemoBody.Text;
		//dr["MemoDate"] = txtMemoDate.

		dr["InspectionId"] = InspectionId;
		//dtMemoDetails.Rows.Add(dr);
			
		}

		gvMemo.DataSource = (DataTable) ViewState["MemoDetails"];
	//	gvMemo.DataBind();
		gvMemo.SelectedIndex = -1;
		txtSubject.Text = "";
		txtMemoDate.Text = "";
		txtMemoBody.Text = "";

		((Button) fvMemo.FindControl("btnAdd")).Visible = true;
		((Button) fvMemo.FindControl("btnUpdate")).Visible = false;
	

	}

	protected void btnAddNewMemo_Click(object sender, EventArgs e)
	{
		mvMemoDetails.SetActiveView(mvMemoDetails.Views[1]);
		fvMemo.ChangeMode(FormViewMode.Insert);
		gvMemo.DataBind();

	}


	//protected void btnAddMemoAction_Click(object sender, EventArgs e)
	//{

	//    string Mode = "Ins";
	//    Guid InspectionMemoId = Guid.Empty;
	//    if (null == ViewState["MemoActionDetails"])
	//    {
	//        ViewState["MemoActionDetails"] = new Inspection().GetMemoActionByMemoId(InspectionMemoId);
	//        InspectionMemoId = Guid.Empty;
	//    }
	//    if (fvActionTaken.CurrentMode == FormViewMode.Edit)
	//    {
	//        InspectionMemoId = (Guid) fvActionTaken.DataKey["InspectionMemoId"];
	//        Mode = "Upd";
	//    }

	//    DataTable dtMemoActionDetails = (DataTable) ViewState["MemoActionDetails"];

	//    TextBox txtActionTaken = ((TextBox) fvActionTaken.FindControl("txtMemoActionBody"));
	//    TextBox txtMemoActionDate = ((TextBox) fvActionTaken.FindControl("txtMemoActionDate"));

		
	//    DataRow dr = dtMemoActionDetails.NewRow();

		
	//        dr["InspectionMemoId"] = Guid.NewGuid();

	//        dr["ActionTaken"] = txtActionTaken.Text;
	//        dr["ActionTakenDate"] = txtMemoActionDate.Text.ToString();

	//    gvMemoActionTaken.DataSource = (DataTable) ViewState["MemoActionDetails"];
		
	//    gvMemoActionTaken.SelectedIndex = -1;
	//    mvMemoActionTaken.SetActiveView(mvMemoActionTaken.Views[0]);

		

	//}
	protected void odsInspectionMemoAction_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{

		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	protected void fvActionTaken_ItemInserting(object sender, FormViewInsertEventArgs e)
	{

		e.Values.Add("InspectionMemoId", fldInspectionMemoId.Value);
		Global.SetFormViewParameters(e.Values, Inspection.GetInspectionActionRow());
		


	}
	protected void odsMemo_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");




	}
	protected void fvMemo_ItemInserting(object sender, FormViewInsertEventArgs e)
	{

		e.Values.Add("InspectionId", fldInspectionId.Value);
		Global.SetFormViewParameters(e.Values, Inspection.GetInspectionMemoRow());

	}
	protected void fvMemo_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
		mvMemoDetails.SetActiveView(mvMemoDetails.Views[0]);
		

	}
}
