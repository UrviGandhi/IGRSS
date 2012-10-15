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
using System.Threading;
public partial class NewRefundApplication : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		FVRefundApplication.InsertItem(true);
	}

	DataTable dt = new DataTable();
	DataTable dtActsApplicable = new DataTable();
	public void InitStampDetails()
	{
	 dt=(DataTable)Session["StampDetails"];
	 if (dt == null)
	 {
		 dt = new DataTable();
		 dt.Columns.Add("StampType");
		 dt.Columns.Add("StampName");
		 dt.Columns.Add("Qty");
		 dt.Columns.Add("Nos");
		 dt.PrimaryKey = new DataColumn[] { dt.Columns["StampType"] };
	 }
	}

	public void InitActsApplicable()
	{
		dtActsApplicable = (DataTable) Session["ActsApplicable"];
		if (dtActsApplicable == null)
		{
			dtActsApplicable = new DataTable();
			dtActsApplicable.Columns.Add("ActId",typeof(Guid));
			dtActsApplicable.Columns.Add("Checked",typeof(bool));
			dtActsApplicable.PrimaryKey = new DataColumn[] { dtActsApplicable.Columns["ActId"] };
		}
	}

	protected void btnAddStamp_Click(object sender, EventArgs e)
	{
		InitStampDetails();
		dt.Rows.Add(dlRevenueStampId.SelectedValue, dlRevenueStampId.SelectedItem.Text, TxtReturnedQty.Text, txtStampsNumbers.Text);
		dt.AcceptChanges();
		gvRefundStampDetails.DataSource = dt;
		gvRefundStampDetails.DataBind();
		Session["StampDetails"] = dt;
		txtStampsNumbers.Text = "";
		TxtReturnedQty.Text = "";
		
	}

	protected void FVRefundApplication_ItemInserting(object sender, FormViewInsertEventArgs e)
	{ //Getting the session  object StampDetails  in the ItemInserting Event of FVRefundApplication.

		InitStampDetails();
		//Adding The DataTable dt to the eventArgs of FVRefundApplication  
		e.Values.Add("StampDetails", dt);

		InitActsApplicable();
		int i = dtActsApplicable.Columns.Count;
		foreach (ListItem item in chkLstBx.Items)
		{
			dtActsApplicable.Rows.Add(item.Value, item.Selected);
		}

		e.Values.Add("ActsApplicable", dtActsApplicable);

	}

	protected void btnUpdateStamp_Click(object sender, EventArgs e)
	{
		InitStampDetails();

		DataRow dr = dt.Rows.Find(gvRefundStampDetails.SelectedDataKey.Value);
		dr["StampType"] = dlRevenueStampId.SelectedValue;
		dr["StampName"] = dlRevenueStampId.SelectedItem.Text;
		dr["Qty"] = TxtReturnedQty.Text;
		dr["Nos"] = txtStampsNumbers.Text;
		dt.AcceptChanges();
		gvRefundStampDetails.DataSource = dt;
		gvRefundStampDetails.DataBind();
		btnAddStamp.Visible = true;
	}

	protected void gvRefundStampDetails_RowEditing(object sender, GridViewEditEventArgs e)
	{
		//InitStampDetails();
		////dt = InitTable(gvRefundStampDetails.DataSource);
		////dlRevenueStampId.Items.FindByValue(gvRefundStampDetails.DataKeys[e.NewEditIndex].Value.ToString()).Selected.ToString();
		//DataRow dr = dt.Rows.Find(gvRefundStampDetails.DataKeys[e.NewEditIndex].Value.ToString());
		//dlRevenueStampId.SelectedIndex = dlRevenueStampId.Items.IndexOf(dlRevenueStampId.Items.FindByValue((string)dr["StampType"]));

		//TxtReturnedQty.Text = (string) dr["Qty"];
		 
		//txtStampsNumbers.Text = (string) dr["Nos"];
		//btnUpdateStamp.Visible = true;
		//btnAddStamp.Visible = false;
		}

	protected void gvRefundStampDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		InitStampDetails();
		dt.Rows.Find(gvRefundStampDetails.DataKeys[e.RowIndex].Value).Delete();
		dt.AcceptChanges();
		gvRefundStampDetails.DataSource = dt;
		gvRefundStampDetails.DataBind();
	}
	protected void gvRefundStampDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		InitStampDetails();
		//dt = InitTable(gvRefundStampDetails.DataSource);
		dlRevenueStampId.SelectedIndex = dlRevenueStampId.Items.IndexOf(dlRevenueStampId.Items.FindByValue(gvRefundStampDetails.SelectedDataKey.Value.ToString()));
		TxtReturnedQty.Text = gvRefundStampDetails.SelectedRow.Cells[2].Text;
		txtStampsNumbers.Text = gvRefundStampDetails.SelectedRow.Cells[3].Text;
		btnUpdateStamp.Visible = true;
		btnAddStamp.Visible = false;
	}

	protected void Button3_Click(object sender, EventArgs e)
	{
		mvRefund.ActiveViewIndex = 1;
		FVRefundApplication.ChangeMode(FormViewMode.Edit);
	}
	protected void GvRefundAlerts_SelectedIndexChanged(object sender, EventArgs e)
	{
		odsRefundDetails.SelectParameters["RefundApplicationId"].DefaultValue = GvRefundAlerts.SelectedDataKey.Value.ToString(); 
		//FVRefundApplication.ChangeMode(FormViewMode.Edit);
		FVRefundApplication.ChangeMode(FormViewMode.ReadOnly);
		mvRefund.SetActiveView(mvRefund.Views[0]);
		
	}
	protected void FVRefundApplication_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{
	 string TxtTotalValueOfStamps = ((TextBox) FVRefundApplication.FindControl("TxtTotalValueOfStamps")).Text;
      
	}
	
	protected void FVRefundApplication_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
	   //gvRefundStampDetails.Visible=false;
	   //lblActApplicable.Visible=false;
	   //chkLstBx.Visible=false;
	   // TxtActRemarks.Visible=false;
	   // btnAddStamp.Visible=false;
	   // btnUpdateStamp.Visible=false;
	   // txtStampsNumbers.Visible=false;
	   // lblStampsSerielNo.Visible=false;
	   // txtStampsNumbers.Visible=false;
	   // TxtReturnedQty.Visible=false;
	   // dlRevenueStampId.Visible = false;
	   // TxtReturnedQty.Visible = false;
	   // lblStampQuantity.Visible = false;
	   // gvRefundStampDetails.Visible = false;
	   // lblAddStampDetails.Visible = false;
	   // lblAppliedActs.Visible = false;
	   // lblStampType.Visible = false;
	   // lblAppliedActsRemarks.Visible = false;

		//string TxtTotalValueOfStamps = ((TextBox) FVRefundApplication.FindControl("TxtTotalValueOfStamps")).Text;

	}
	protected void FVRefundApplication_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
	{
		mvRefund.ActiveViewIndex = 1;
	}
	protected void GvRefundAlerts_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		//if (e.CommandName = "Issue")
		//{

		//}
	}
	protected void FVRefundApplication_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		InitActsApplicable();
		InitStampDetails();
		//Adding The DataTable dt to the eventArgs of FVRefundApplication  
	
		e.NewValues.Add("StampDetails", dt);
        
		dt.Rows.Add(dlRevenueStampId.SelectedValue, dlRevenueStampId.SelectedItem.Text, TxtReturnedQty.Text, txtStampsNumbers.Text);
		dt.AcceptChanges();
		gvRefundStampDetails.DataSource = dt;
		gvRefundStampDetails.DataBind();
		Session["StampDetails"] = dt;
		txtStampsNumbers.Text = "";
		TxtReturnedQty.Text = "";

		//******
		gvRefundStampDetails.DataSource = dt;
		gvRefundStampDetails.DataBind();

		RefundApplication RfApplication = new RefundApplication();
		Guid RefundApplicationId = (Guid) FVRefundApplication.SelectedValue;

		DataTable dtStampDetails = RfApplication.SelectRefundStampDetailsByRefundId(RefundApplicationId);
		gvRefundStampDetails.DataSource = dtStampDetails;
		gvRefundStampDetails.DataBind();

	}
	protected void btnApprove_Click(object sender, EventArgs e)
	{
		//RefundApplication RfApplication = new RefundApplication();
		//RfApplication.InsertNewRefundOrders(
		string userName = Thread.CurrentPrincipal.Identity.Name;
		string RefundOrderID=((TextBox)FVRefundApplication.FindControl("txtRefundOrderId")).Text;
		DateTime RefundDate = Convert.ToDateTime(((TextBox) FVRefundApplication.FindControl("txtRefundDate")).Text);
		RefundApplication RfApplication = new RefundApplication();
         Guid RefundApplicationId=(Guid)FVRefundApplication.SelectedValue;
		 DataTable dtTotAmount = RfApplication.GetAllRefundApplicationsById(RefundApplicationId);
		 string TotAmount = Convert.ToString(dtTotAmount.Rows[0]["TotalValueOfStamps"]);
		 decimal cTotAmount = Convert.ToDecimal(TotAmount);
		 decimal PenalityAmount = (cTotAmount)*Convert.ToDecimal(0.10);
		 decimal RefundAmount = (cTotAmount)*Convert.ToDecimal(0.90);
         RfApplication.UpdateRefundOrderDetails(RefundApplicationId, PenalityAmount, RefundAmount, RefundOrderID, RefundDate, userName, DateTime.Now);

	}

protected void EditOnApproving_Click(object sender, EventArgs e)
	{
		FVRefundApplication.ChangeMode(FormViewMode.Edit);

		//string RefundOrderID = ((TextBox) FVRefundApplication.FindControl("txtRefundOrderId")).Text;
		//string RefundDate = Convert.ToDateTime(((TextBox) FVRefundApplication.FindControl("txtRefundDate")).Text);
		//RefundApplication RfApplication = new RefundApplication();
		//Guid RefundApplicationId = (Guid) FVRefundApplication.SelectedValue;
		//DataTable dt = new DataTable();
		//string totAmount = RfApplication.GetAllRefundApplicationsById(RefundApplicationId);
		//decimal CtotAmount = Convert.ToString(dtTotAmount.Rows[0]["TotalValueOfStamps"]);
		//decimal cTotAmount = Convert.ToDecimal(TotAmount);
		//decimal PenalityAmount = (cTotAmount) * Convert.ToString(0.10);
		//decimal RefundAmount = (cTotAmount) * Convert.ToDecimal(0.90);
		//RfApplication.GetAllRefundOrders();
		//RfApplication.SelectRefundStampDetailsByRefundId(RefundApplicationId);
		//DataTable dtNew = new DataTable();
		//RfApplication.GetAllStampDetails();



	}	
}
