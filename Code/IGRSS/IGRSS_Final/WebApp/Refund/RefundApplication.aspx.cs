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
using System.Threading;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using System.Collections.Specialized;
using IGRSS.DataAccessLayer.ConfigTableAdapters;
using Resources;
using System.Collections.Generic;
public partial class Refund_RefundApplication : IgrssPage
{
	DataTable dtActsApplicable = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			if (Request.Params["AlertId"] != null)
			{
				IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
                fldRefundId.Value = alert.SessionData["FileId"].ToString();
                fvRefundApplication.ChangeMode(FormViewMode.Edit);
                FileManagement_FileForward ffc = (FileManagement_FileForward)fvRefundApplication.FindControl("FileForward1");
                ffc.FileId = new Guid(fldRefundId.Value);
               
                
			}
            if (Request.Params["RedirID"] != null)
            {
                fldRefundId.Value = Request.Params["RedirID"].ToString();
                mvRefund.SetActiveView(mvRefund.Views[2]);
                FvRefundReadOnly.ChangeMode(FormViewMode.ReadOnly);
                ((Label)FvRefundReadOnly.FindControl("lblfileNOR")).Text = FileManager.GetFileNo(new Guid(fldRefundId.Value));
                
            }
			
				switch (Request.Params["Mode"])
				{
					case "DataEntry":
						mvRefund.SetActiveView(mvRefund.Views[0]);
						fvRefundApplication.ChangeMode(FormViewMode.Insert);
						break;
					case "Verify":
						mvRefund.SetActiveView(mvRefund.Views[0]);
                        fvRefundApplication.ChangeMode(FormViewMode.Edit);
						break;
					case "Approve":
						mvRefund.SetActiveView(mvRefund.Views[0]);
						fvRefundApplication.ChangeMode(FormViewMode.ReadOnly);

						break;
					case "ReadOnly":
						mvRefund.SetActiveView(mvRefund.Views[2]);
                        ((Label)fvRefundApplication.FindControl("lblfileNOR")).Text=FileManager.GetFileNo(new Guid(fldRefundId.Value));
						break;
				}
		}
        if (Request.Params["AlertId"] != null)
        {
            IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
            fldRefundId.Value = alert.SessionData["FileId"].ToString();
            //fvRefundApplication.ChangeMode(FormViewMode.Edit);
            FileManagement_FileForward ffc = (FileManagement_FileForward)fvRefundApplication.FindControl("FileForward1");
            if (ffc != null)
            {
                ffc.FileId = new Guid(fldRefundId.Value);
            }


        }

		//Session["Mode"] = Request.Params["Mode"];
		if (fvRefundApplication.CurrentMode == FormViewMode.Insert)
		{
			IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
			XmlRefundType.Data = (string) ConfigAdapter.GetConfigByModule("REF", "RefType");
			XmlRefundType.DataBind();
		}
		if (fvRefundApplication.CurrentMode == FormViewMode.Edit)
		{
			IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
			XmlRefundType.Data = (string) ConfigAdapter.GetConfigByModule("REF", "RefType");
			XmlRefundType.DataBind();
		}

        //DropDownList dlOfficeName = (DropDownList) fvRefundApplication.FindControl("dlOfficeName");
        //Profile.Permissions.FillOffices(dlOfficeName, "REF", "Insert");


	}
    public void InitActsApplicable()
	{
		dtActsApplicable = (DataTable) ViewState["ActsApplicable"];
		if (dtActsApplicable == null)
		{
			dtActsApplicable = new DataTable();
			dtActsApplicable.Columns.Add("ActId", typeof(Guid));
			dtActsApplicable.Columns.Add("Checked", typeof(bool));
			//dtActsApplicable.Columns.Add("Remarks",typeof(string));

			dtActsApplicable.PrimaryKey = new DataColumn[] { dtActsApplicable.Columns["ActId"] };
		}
	}
    protected void fvRefundApplication_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, RefundApplication.GetRow());

		//DataTable StampDetails = (DataTable) ViewState["gvRefundStampDetailsIns"];

		DataTable StampDetails = (DataTable) ViewState["StampDetails"];
        if (StampDetails == null)
        {
            e.Cancel = true;
            //((Label)Page.Master.FindControl("Label2")).Text = "Please Enter Stamp Details";
            
        }
        else
        {
            e.Values.Add("StampDetails", StampDetails);

            InitActsApplicable();

            int i = dtActsApplicable.Columns.Count;
            foreach (ListItem item in ((CheckBoxList)fvRefundApplication.FindControl("chkLstBxIns")).Items)
            {
                dtActsApplicable.Rows.Add(item.Value, item.Selected);
            }


            e.Values.Add("ActsApplicable", dtActsApplicable);

            //string txtRemarksActIns = (((TextBox) fvRefundApplication.FindControl("txtRemarksActIns")).Text);
            //if (txtRemarksActIns != null)
            //{


            //    e.Values.Add("ActsApplicable", txtRemarksActIns);
            //}
            //Code Added By Akhilesh.
            FileManagement_FileForward ffc = (FileManagement_FileForward)fvRefundApplication.FindControl("FileForward1");
            Remarks rem = new Remarks();
            rem.Subject = ((TextBox)ffc.FindControl("txtRemarkSubject")).Text;
            rem.Body = ((TextBox)ffc.FindControl("txtRemarkBody")).Text;
            e.Values.Add("rem", rem);
            UserControls_DocumentDownload ddR = (UserControls_DocumentDownload)fvRefundApplication.FindControl("ddRefund");
            //Document doc = new Document();
            //doc.DocumentName = ((TextBox)ddR.FindControl("DocNameTextBox")).Text;
            //doc.Content = Convert.ToByte(((HiddenField)ddR.FindControl("fldContent")).Value);

        }
	}
    protected void btnApprove_Click(object sender, EventArgs e)
	{
        //string userName = Thread.CurrentPrincipal.Identity.Name;
        //string RefundOrderID = ((TextBox) fvRefundApplication.FindControl("txtRefundOrderIdItm")).Text;
        //DateTime RefundDate = Convert.ToDateTime(((TextBox) fvRefundApplication.FindControl("txtRefundOrderDateItm")).Text);
        //RefundApplication RfApplication = new RefundApplication();
        ////Guid RefundApplicationId = (Guid) fvRefundApplication.SelectedValue;

        ////Guid RefundApplicationId = (Guid) GvRefundAlerts.SelectedValue;
        ////DataTable dtTotAmount = RfApplication.GetAllRefundApplicationsById(RefundApplicationId);
        //string TotAmount = Convert.ToString(dtTotAmount.Rows[0]["TotalValueOfStamps"]);
        //decimal cTotAmount = Convert.ToDecimal(TotAmount);
        //decimal PenalityAmount = (cTotAmount) * Convert.ToDecimal(0.10);
        //decimal RefundAmount = (cTotAmount) * Convert.ToDecimal(0.90);
        //RfApplication.UpdateRefundOrderDetails(RefundApplicationId, PenalityAmount, RefundAmount, RefundOrderID, RefundDate, userName, DateTime.Now);
        //fvRefundApplication.ChangeMode(FormViewMode.ReadOnly);
        RefundApplication.ApproveRefund(new Guid(fldRefundId.Value));
        Dictionary<string, string> reportParams = new Dictionary<string, string>();
        string RefundId =fldRefundId.Value;
        reportParams.Add("RefundApplicationId", RefundId);
        Session["ReportParams"] = reportParams;
        Session["ReportName"] = "RefundOrder";
        Response.Redirect("~/Report/Report.aspx");
	}
    protected void GvRefundAlerts_SelectedIndexChanged(object sender, EventArgs e)
	{
		        string ID = GvRefundAlerts.SelectedDataKey.Value.ToString();
		        fldRefundId.Value = ID;
	            mvRefund.SetActiveView(mvRefund.Views[2]);
				FvRefundReadOnly.ChangeMode(FormViewMode.ReadOnly);

                //fvRefundApplication.ChangeMode(FormViewMode.ReadOnly);
		//        break;
		//    case "Approve":
		//        mvRefund.SetActiveView(mvRefund.Views[0]);
		//        fvRefundApplication.ChangeMode(FormViewMode.ReadOnly);
		//        break;
		//}
	


	}
    protected void btnCancel_Click(object sender, EventArgs e)
	{
        RefundApplication.RejectRefund(new Guid(fldRefundId.Value));
		mvRefund.SetActiveView(mvRefund.Views[1]);

	}
    protected void btnUpdate_Click(object sender, EventArgs e)
	{
		OdsRefundDetails.SelectParameters["RefundApplicationId"].DefaultValue = GvRefundAlerts.SelectedDataKey.Value.ToString();
		RefundApplication Rf = new RefundApplication();
		DataTable dtGridUpd = new DataTable();
		Guid RefundApplicationId = (Guid) GvRefundAlerts.SelectedValue;
		dtGridUpd = Rf.SelectRefundStampDetailsByRefundId(RefundApplicationId);
		GridView Gv = ((GridView) fvRefundApplication.FindControl("gvRefundStampDetailsIns"));
		Gv.DataSource = dtGridUpd;
		Gv.DataBind();
	}
    protected void fvRefundApplication_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, RefundApplication.GetRow());
		DataTable StampDetails = (DataTable) ViewState["StampDetails"];
		e.NewValues.Add("StampDetails", StampDetails);
		InitActsApplicable();
		foreach (ListItem item in ((CheckBoxList) fvRefundApplication.FindControl("chkLstBxUpd")).Items)
		{
			dtActsApplicable.Rows.Add(item.Value, item.Selected);
		}
		e.NewValues.Add("AlertId", new Guid(Request.Params["AlertId"]));
		e.NewValues.Add("ActsApplicable", dtActsApplicable);



	}
    protected void fvRefundApplication_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
	{
		//mvRefund.SetActiveView(mvRefund.Views[1]);
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
    protected void fvRefundApplication_DataBinding(object sender, EventArgs e)
	{
		
  
		 
	}
	protected void OdsRefundDetails_Selected(object sender, ObjectDataSourceStatusEventArgs e)
	{
		RefundApplication app = new RefundApplication();
		DataTable dt = app.SelectRefundStampDetailsByRefundId((Guid) e.OutputParameters["RefundApplicationId"]);
		e.OutputParameters.Add("StampDetails", dt);
	}
    protected void fvRefundApplication_DataBound(object sender, EventArgs e)
	{
		if (fvRefundApplication.CurrentMode == FormViewMode.Edit)
		{
			RefundApplication app = new RefundApplication();

			Guid RefundApplicationId = (Guid) fvRefundApplication.DataKey["RefundApplicationId"];
			ViewState["StampDetails"] = app.SelectRefundStampDetailsByRefundId(RefundApplicationId);

			GridView grd = (GridView) fvRefundApplication.FindControl("gvRefundStampDetailsUpd");
			grd.DataSource = (DataTable) ViewState["StampDetails"];
			grd.SelectedIndex = -1;
			grd.DataBind();

			DataTable ActsApplicable = app.SelectActDetailsByRefundApplicationId(RefundApplicationId);

			//ViewState["dtActsApplicable"] = ActsApplicable;

			CheckBoxList lstActs = (CheckBoxList) fvRefundApplication.FindControl("chkLstBxUpd");
			foreach (DataRow act in ActsApplicable.Rows)
			{
				ListItem item = new ListItem();
				item.Text = Convert.ToString(act["NameOfAct"]);
				item.Selected = Convert.ToBoolean(act["Checked"]);
				item.Value = ((Guid) act["ActId"]).ToString();
				lstActs.Items.Add(item);
			}
		}
		if (fvRefundApplication.CurrentMode == FormViewMode.ReadOnly)
		{
			RefundApplication app = new RefundApplication();
			Guid RefundApplicationId = (Guid) fvRefundApplication.DataKey["RefundApplicationId"];
			DataTable ItmActsApplicable = app.SelectActDetailsByRefundApplicationId(RefundApplicationId);
			ViewState["dtActsApplicable"] = ItmActsApplicable;

			CheckBoxList lstActs = (CheckBoxList) fvRefundApplication.FindControl("chkLstBxItm");
			foreach (DataRow act in ItmActsApplicable.Rows)
			{
				ListItem item = new ListItem();
				item.Text = Convert.ToString(act["NameOfAct"]);
				item.Selected = Convert.ToBoolean(act["Checked"]);
				item.Value = ((Guid) act["ActId"]).ToString();
				lstActs.Items.Add(item);
			}
		}
	}
    protected void fvRefundApplication_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	} 
    protected void OdsRefund_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
    protected void OdsRefund_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		Parameters.Values.BeginEdit();
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

	}
    protected void fvRefundApplication_ModeChanged(object sender, EventArgs e)
	{
		FormView Form = (FormView) sender;
		switch (((FormView) sender).CurrentMode)
		{
			case FormViewMode.Edit:
				ViewState["StampDetails"] = new RefundApplication().SelectRefundStampDetailsByRefundId((Guid) Form.DataKey["RefundApplicationId"]);

				GridView StampDetailsGrid = (GridView) Form.FindControl("gvRefundStampDetailsUpd");
				if (null != StampDetailsGrid)
				{
					StampDetailsGrid.DataSource = (DataTable) ViewState["StampDetails"];
					StampDetailsGrid.DataBind();
				}
				break;
			case FormViewMode.Insert:
				break;
			case FormViewMode.ReadOnly:
				break;
			default:
				break;
		}
	}

	protected void fvRefundApplication_ModeChanging(object sender, FormViewModeEventArgs e)
	{
		switch (e.NewMode)
		{
			case FormViewMode.Edit:
				FormView Form = (FormView) sender;
				ViewState["StampDetails"] = new RefundApplication().SelectRefundStampDetailsByRefundId((Guid) Form.DataKey["RefundApplicationId"]);

				GridView StampDetailsGrid = (GridView) Form.FindControl("gvRefundStampDetailsUpd");
				if (null != StampDetailsGrid)
				{
					StampDetailsGrid.DataSource = (DataTable) ViewState["StampDetails"];
					StampDetailsGrid.DataBind();
				}

				DropDownList dlOfficeName = (DropDownList) fvRefundApplication.FindControl("dlOfficeName");
				Profile.Permissions.FillOffices(dlOfficeName, "REF", "Insert");

				break;
			case FormViewMode.Insert:
				break;
			case FormViewMode.ReadOnly:
				break;
			default:
				break;
		}
	}

    protected void OdsRefundDetails_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        Parameters.Values.BeginEdit();
        e.InputParameters["Parameter"] = Parameters;
        bool Verified = ((CheckBox)fvRefundApplication.FindControl("chkVerified")).Checked;
        e.InputParameters["Verified"] = Verified;
        e.InputParameters.Remove("Values");
    }
    protected void OdsRefundDetails_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{

		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}

	protected void btnCancel_Click1(object sender, EventArgs e)
	{
		mvRefund.SetActiveView(mvRefund.Views[1]);
	}

	protected void AddStampDetails_Click(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid RefundApplicationId = Guid.Empty;

		if (null == ViewState["StampDetails"])
		{
			ViewState["StampDetails"] = new RefundApplication().SelectRefundStampDetailsByRefundId(Guid.Empty);
			RefundApplicationId = Guid.Empty;
		}
		if (fvRefundApplication.CurrentMode == FormViewMode.Edit)
		{
			RefundApplicationId = (Guid) fvRefundApplication.DataKey["RefundApplicationId"];
			Mode = "Upd";
		}

		GridView gvStampDetails = ((GridView) fvRefundApplication.FindControl("gvRefundStampDetails" + Mode));
		DataTable dtStampDetails = (DataTable) ViewState["StampDetails"];

		DropDownList ddlRevenueStamp = ((DropDownList) fvRefundApplication.FindControl("ddlRevenueStampId" + Mode));
		TextBox txtRefundQty = ((TextBox) fvRefundApplication.FindControl("txtReturnedQuantity" + Mode));
		TextBox txtSerialNo = ((TextBox) fvRefundApplication.FindControl("txtStampSlNo" + Mode));

		object[] keys = {RefundApplicationId,
		new Guid(ddlRevenueStamp.SelectedValue)};

		DataRow dr = dtStampDetails.Rows.Find(keys);

		if (null == dr)
		{
			dr = dtStampDetails.NewRow();
			dr["RevenueStampId"] = new Guid(ddlRevenueStamp.SelectedValue);
			dr["StampName"] = ddlRevenueStamp.SelectedItem.Text;
			dr["ReturnedQty"] = txtRefundQty.Text;
			dr["StampNumber"] = txtSerialNo.Text;
			dr["RefundApplicationId"] = RefundApplicationId;
			dtStampDetails.Rows.Add(dr);
			ddlRevenueStamp.SelectedIndex = -1;
			txtRefundQty.Text = "";
			txtSerialNo.Text = "";
		}

		((Button) fvRefundApplication.FindControl("btnAddStamp" + Mode)).Visible = true;
		((Button) fvRefundApplication.FindControl("btnUpdateStamp" + Mode)).Visible = false;

		ViewState["StampDetails"] = dtStampDetails;
		gvStampDetails.DataSource = (DataTable) ViewState["StampDetails"];
		gvStampDetails.DataBind();
	}

	protected void UpdateStampDetails_Click(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid RefundApplicationId = Guid.Empty;
		if (null == ViewState["StampDetails"])
		{
			ViewState["StampDetails"] = new RefundApplication().SelectRefundStampDetailsByRefundId(Guid.Empty);
			RefundApplicationId = Guid.Empty;
		}
		if (fvRefundApplication.CurrentMode == FormViewMode.Edit)
		{
			RefundApplicationId = (Guid) fvRefundApplication.DataKey["RefundApplicationId"];
			Mode = "Upd";
		}

		GridView gvStampDetails = ((GridView) fvRefundApplication.FindControl("gvRefundStampDetails" + Mode));
		DataTable dtStampDetails = (DataTable) ViewState["StampDetails"];

		DropDownList ddlRevenueStamp = ((DropDownList) fvRefundApplication.FindControl("ddlRevenueStampId" + Mode));
		TextBox txtRefundQty = ((TextBox) fvRefundApplication.FindControl("txtReturnedQuantity" + Mode));
		TextBox txtSerialNo = ((TextBox) fvRefundApplication.FindControl("txtStampSlNo" + Mode));

		object[] keys = {RefundApplicationId,
						new Guid(ddlRevenueStamp.SelectedValue)};
		DataRow dr = dtStampDetails.Rows.Find(keys);

		if (null == dr)
		{
			keys[1] = gvStampDetails.SelectedDataKey["RevenueStampId"];
			dr = dtStampDetails.Rows.Find(keys);
		}

		if (null != dr)
		{
			dr["RevenueStampId"] = new Guid(ddlRevenueStamp.SelectedValue);
			dr["StampName"] = ddlRevenueStamp.SelectedItem.Text;
			dr["ReturnedQty"] = txtRefundQty.Text;
			dr["StampNumber"] = txtSerialNo.Text;
		}

		((Button) fvRefundApplication.FindControl("btnAddStamp" + Mode)).Visible = true;
		((Button) fvRefundApplication.FindControl("btnUpdateStamp" + Mode)).Visible = false;

		gvStampDetails.DataSource = (DataTable) ViewState["StampDetails"];
		gvStampDetails.DataBind();
		gvStampDetails.SelectedIndex = -1;
	}

	protected void StampDetailsGrid_SelectedIndexChanged(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid RefundApplicationId = Guid.Empty;
		if (null == ViewState["StampDetails"])
		{
			ViewState["StampDetails"] = new RefundApplication().SelectRefundStampDetailsByRefundId(Guid.Empty);
			RefundApplicationId = Guid.Empty;
		}
		if (fvRefundApplication.CurrentMode == FormViewMode.Edit)
		{
			RefundApplicationId = (Guid) fvRefundApplication.DataKey["RefundApplicationId"];
			Mode = "Upd";
		}

		GridView gvStampDetails = (GridView) sender;
		DataTable dtStampDetails = (DataTable) ViewState["StampDetails"];

		DropDownList ddlRevenueStamp = ((DropDownList) fvRefundApplication.FindControl("ddlRevenueStampId" + Mode));
		TextBox txtRefundQty = ((TextBox) fvRefundApplication.FindControl("txtReturnedQuantity" + Mode));
		TextBox txtSerialNo = ((TextBox) fvRefundApplication.FindControl("txtStampSlNo" + Mode));

		object[] keys = new object[gvStampDetails.SelectedDataKey.Values.Count];
		for (int i = 0; i < keys.Length; i++)
		{
			keys[i] = gvStampDetails.SelectedDataKey.Values[i];
		}
		DataRow dr = dtStampDetails.Rows.Find(keys);

		if (null != dr)
		{
			ddlRevenueStamp.SelectedValue = Convert.ToString(dr["RevenueStampId"]);
			txtRefundQty.Text = Convert.ToString(dr["ReturnedQty"]);
			txtSerialNo.Text = Convert.ToString(dr["StampNumber"]);
		}

		((Button) fvRefundApplication.FindControl("btnAddStamp" + Mode)).Visible = false;
		((Button) fvRefundApplication.FindControl("btnUpdateStamp" + Mode)).Visible = true;
	}

	protected void StampDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		Guid RefundApplicationId = Guid.Empty;
		if (null == ViewState["StampDetails"])
		{
			ViewState["StampDetails"] = new RefundApplication().SelectRefundStampDetailsByRefundId(Guid.Empty);
			RefundApplicationId = Guid.Empty;
		}
		if (fvRefundApplication.CurrentMode == FormViewMode.Edit)
		{
			RefundApplicationId = (Guid) fvRefundApplication.DataKey["RefundApplicationId"];
		}

		GridView gvStampDetails = (GridView) sender;
		DataTable dtStampDetails = (DataTable) ViewState["StampDetails"];

		//object[] keys = {RefundApplicationId,
		//                e.Keys["RevenueStampId"]};
		//DataRow dr = dtStampDetails.Rows.Find(keys);

		//if (null != dr)
		//{
		//    dtStampDetails.Rows.Remove(dr);
		//}

		int i = e.RowIndex;
		dtStampDetails.Rows[i].Delete();
		dtStampDetails.AcceptChanges();

		ViewState["StampDetails"] = dtStampDetails;
		gvStampDetails.DataSource = ViewState["StampDetails"];
		gvStampDetails.DataBind();
	}

	//protected void gvRefundStampDetailsIns_RowDeleting(object sender, GridViewDeleteEventArgs e)
	//{
	//    GridView gv = ((GridView) fvRefundApplication.FindControl("gvRefundStampDetailsIns"));
	//    DataTable dttbl = (DataTable) ViewState["dt"];
	//    int i = 0;
	//    i = e.RowIndex;
	//    dttbl.Rows[i].Delete();
	//    dttbl.AcceptChanges();
	//    ViewState["dt"] = dttbl;

	//    gv.DataSource = dttbl;
	//    gv.DataBind();

	//}

	//protected void btnAddStampIns_Click(object sender, EventArgs e)
	//{
	//    Guid RefundApplicationId = Guid.Empty;
	//    if (null == ViewState["StampDetails"])
	//    {
	//        ViewState["StampDetails"] = new RefundApplication().SelectRefundStampDetailsByRefundId(Guid.Empty);
	//    }

	//    DataTable dtStampDetails = (DataTable) ViewState["StampDetails"];
	//    GridView gvRefundStampDetails = ((GridView) fvRefundApplication.FindControl("gvRefundStampDetailsIns"));

	//    DropDownList ddlRevenueStamp = ((DropDownList) fvRefundApplication.FindControl("dlRevenueStampId"));
	//    TextBox txtRefundQty = ((TextBox) fvRefundApplication.FindControl("txtReturnedQuantityIns"));
	//    TextBox txtSerialNo = ((TextBox) fvRefundApplication.FindControl("txtStampSlNoIns"));

	//    object[] keys = {RefundApplicationId,
	//    new Guid(ddlRevenueStamp.SelectedValue)};

	//    DataRow dr = dtStampDetails.Rows.Find(keys);

	//    if (null == dr)
	//    {
	//        dr = dtStampDetails.NewRow();
	//        dr["RevenueStampId"] = new Guid(ddlRevenueStamp.SelectedValue);
	//        dr["StampName"] = ddlRevenueStamp.SelectedItem.Text;
	//        dr["ReturnedQty"] = txtRefundQty.Text;
	//        dr["StampNumber"] = txtSerialNo.Text;
	//        dr["RefundApplicationId"] = RefundApplicationId;
	//        dtStampDetails.Rows.Add(dr);
	//    }

	//    ((Button) fvRefundApplication.FindControl("btnAddStampIns")).Visible = true;
	//    ((Button) fvRefundApplication.FindControl("btnUpdateStampIns")).Visible = false;

	//    ViewState["StampDetails"] = dtStampDetails;
	//    gvRefundStampDetails.DataSource = (DataTable) ViewState["StampDetails"];
	//    gvRefundStampDetails.DataBind();
	//}

	//protected void gvRefundStampDetailsIns_SelectedIndexChanged(object sender, EventArgs e)
	//{
	//    GridView gvRefundStampDetails = (GridView) sender;
	//    DataTable dtStampDetails = (DataTable) ViewState["StampDetails"];

	//    DropDownList ddlRevenueStamp = ((DropDownList) fvRefundApplication.FindControl("dlRevenueStampId"));
	//    TextBox txtRefundQty = ((TextBox) fvRefundApplication.FindControl("txtReturnedQuantityIns"));
	//    TextBox txtSerialNo = ((TextBox) fvRefundApplication.FindControl("txtStampSlNoIns"));

	//    object[] keys = new object[gvRefundStampDetails.SelectedDataKey.Values.Count];
	//    for (int i = 0; i < keys.Length; i++)
	//    {
	//        keys[i] = gvRefundStampDetails.SelectedDataKey.Values[i];
	//    }
	//    DataRow dr = dtStampDetails.Rows.Find(keys);

	//    ddlRevenueStamp.SelectedValue = Convert.ToString(dr["RevenueStampId"]);
	//    txtRefundQty.Text = Convert.ToString(dr["ReturnedQty"]);
	//    txtSerialNo.Text = Convert.ToString(dr["StampNumber"]);

	//    ((Button) fvRefundApplication.FindControl("btnAddStampIns")).Visible = false;
	//    ((Button) fvRefundApplication.FindControl("btnUpdateStampIns")).Visible = true;

	//}

	//protected void btnUpdateStampUpd_Click(object sender, EventArgs e)
	//{

	//    //Update Mode 
	//    GridView gvRefundStampDetails = ((GridView) fvRefundApplication.FindControl("gvRefundStampDetailsUpd"));
	//    DataTable dtStampDetails = (DataTable) ViewState["StampDetails"];

	//    DropDownList ddlRevenueStamp = ((DropDownList) fvRefundApplication.FindControl("dlRevenueStampId"));
	//    TextBox txtRefundQty = ((TextBox) fvRefundApplication.FindControl("txtReturnedQuantityUpd"));
	//    TextBox txtSerialNo = ((TextBox) fvRefundApplication.FindControl("txtStampSlNoUpd"));

	//    object[] keys = new object[gvRefundStampDetails.SelectedDataKey.Values.Count];
	//    for (int i = 0; i < keys.Length; i++)
	//    {
	//        keys[i] = gvRefundStampDetails.SelectedDataKey.Values[i];
	//    }
	//    DataRow dr = dtStampDetails.Rows.Find(keys);

	//    dr["RevenueStampId"] = new Guid(ddlRevenueStamp.SelectedValue);
	//    dr["StampName"] = ddlRevenueStamp.SelectedItem.Text;
	//    dr["ReturnedQty"] = txtRefundQty.Text;
	//    dr["StampNumber"] = txtSerialNo.Text;


	//    ((Button) fvRefundApplication.FindControl("btnAddStampUpd")).Visible = true;
	//    ((Button) fvRefundApplication.FindControl("btnUpdateStampUpd")).Visible = false;

	//    gvRefundStampDetails.DataSource = (DataTable) ViewState["StampDetails"];
	//    gvRefundStampDetails.DataBind();
	//}

	protected void btnInsert_Click(object sender, EventArgs e)
	{

	}

	protected void viewGrid_Activate(object sender, EventArgs e)
	{
		GvRefundAlerts.DataBind();
		GvRefundAlerts.SelectedIndex = -1;
	}

	protected void LinkInsert_Click(object sender, EventArgs e)
	{
		mvRefund.SetActiveView(mvRefund.Views[0]);
		fvRefundApplication.ChangeMode(FormViewMode.Insert);
	}
	protected void LinkEdit_Click(object sender, EventArgs e)
	{
		Session["Click"] = true;
		mvRefund.SetActiveView(mvRefund.Views[1]);

		fvRefundApplication.ChangeMode(FormViewMode.Edit);
	}
    protected void LinkApprove_Click(object sender, EventArgs e)
	{
		Session["Click"] = false;
		mvRefund.SetActiveView(mvRefund.Views[1]);
		fvRefundApplication.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void FvRefundReadOnly_DataBound(object sender, EventArgs e)
	{
		RefundApplication app = new RefundApplication();
		Guid RefundApplicationId = (Guid) FvRefundReadOnly.DataKey["RefundApplicationId"];
		DataTable ItmActsApplicable = app.SelectActDetailsByRefundApplicationId(RefundApplicationId);
		ViewState["dtActsApplicable"] = ItmActsApplicable;

		CheckBoxList lstActs = (CheckBoxList) FvRefundReadOnly.FindControl("chkLstBxReadOnly");
		foreach (DataRow act in ItmActsApplicable.Rows)
		{
			ListItem item = new ListItem();
			item.Text = Convert.ToString(act["NameOfAct"]);
			item.Selected = Convert.ToBoolean(act["Checked"]);
			item.Value = ((Guid) act["ActId"]).ToString();
			lstActs.Items.Add(item);
		}


	}
	protected void BackToGrid_Click(object sender, EventArgs e)
	{
		mvRefund.SetActiveView(mvRefund.Views[1]);

	}
	protected void GvRefundReadOnly_SelectedIndexChanged(object sender, EventArgs e)
	{
		mvRefund.SetActiveView(mvRefund.Views[1]);
		FvRefundReadOnly.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void GvRefundAlerts_RowCommand(object sender, GridViewCommandEventArgs e)
	{

	}
	protected void dlTypeOfRefundIns_DataBinding(object sender, EventArgs e)
	{

	}
    protected void dlOfficeName_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "REF", Request.Params["Mode"]);
    }
    protected void dlOfficeName_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void dlOfficeName_Load1(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "REF", Request.Params["Mode"]);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
    protected void OdsRefundDetails_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        
        
    }
    protected void fvRefundApplication_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)


            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);


        else

            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
    }
    protected void txtRefundPrefixItm_TextChanged(object sender, EventArgs e)
    {

    }
}