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
using IGRSS.DataAccessLayer.ConfigTableAdapters;
using IGRSS.BusinessObjects;
using AdjudicationRequestRow = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestRow;
using Resources;
public partial class ValuationApplication : IgrssPage
{

    /// <summary>
    /// 
    /// </summary>
    IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
		{
			if (Request.Params["AlertId"] != null)
			{
				IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
				fldValId.Value = alert.SessionData["ValuationFormId"].ToString();
			}
            if (Request.Params["RedirID"] != null)
            {
                fldAdjId.Value = Request.Params["RedirID"].ToString();
                mvAdjRequest.SetActiveView(mvAdjRequest.Views[2]);
                fvReadOnly.ChangeMode(FormViewMode.ReadOnly);
            }
            switch (Request.Params["Mode"])
            {
                case "DataEntry":
                    mvAdjRequest.SetActiveView(mvAdjRequest.Views[1]);
                    fvValuationForm.ChangeMode(FormViewMode.Insert);
                    break;
                case "Verify":
                    mvAdjRequest.SetActiveView(mvAdjRequest.Views[1]);
                    fvValuationForm.ChangeMode(FormViewMode.Edit);
                    break;
                case "Readonly":
                    mvAdjRequest.SetActiveView(mvAdjRequest.Views[0]);
					
                    break;
            }
        }
        Session["Mode"] = Request.Params["Mode"];
     if (fvValuationForm.CurrentMode == FormViewMode.Insert)
        {

            xdsCompoundWall.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "ElectType");
            xdsCompoundWall.DataBind();
            xdsPropertyType.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "PROPERTYT");
            xdsPropertyType.DataBind();
            xdsElectricalElectrification.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "WallType");
            xdsElectricalElectrification.DataBind();

        }
        if (fvValuationForm.CurrentMode == FormViewMode.Edit)
        {
            xdsCompoundWall.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "ElectType");
            xdsCompoundWall.DataBind();
            xdsPropertyType.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "PROPERTYT");
            xdsPropertyType.DataBind();
            xdsElectricalElectrification.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "WallType");
            xdsElectricalElectrification.DataBind();

        }
        if (fvReadOnly.CurrentMode == FormViewMode.ReadOnly)
        {
            xdsCompoundWall.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "ElectType");
            xdsCompoundWall.DataBind();
            xdsPropertyType.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "PROPERTYT");
            xdsPropertyType.DataBind();
            xdsElectricalElectrification.Data = (string)ConfigAdapter.GetConfigByModule("ADJ", "WallType");
            xdsElectricalElectrification.DataBind();

        }

    }
    protected void fvValuationForm_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        ViewState["OfficeId"] = e.Values["OfficeId"];
        Global.SetFormViewParameters(e.Values, AdjudicationRequest.GetValuationFormRow());
        DataTable dtDocDetails = (DataTable)ViewState["DocDetails"];
        e.Values.Add("DocDetails", dtDocDetails);
    }
    protected void ddlTypeOfPropertyIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        String PropertyType = ((DropDownList)fvValuationForm.FindControl("ddlTypeOfPropertyIns")).SelectedItem.Text;
        switch (PropertyType)
        {
            case "Residencial":
                {
                    MultiView mvR = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsIns"));
                    mvR.SetActiveView(mvR.Views[0]);
                    break;
                }
            case "Commercial":
                {
                    MultiView mvC = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsIns"));
                    mvC.SetActiveView(mvC.Views[1]);
                    break;
                }
            case "Industrial":
                {

                    MultiView mvi = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsIns"));
                    mvi.SetActiveView(mvi.Views[2]);
                    break;
                }

        }
    }
    protected void gdAdjReuDtl_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch ((string)Session["Mode"])
        {
            case "Verify":
                mvAdjRequest.SetActiveView(mvAdjRequest.Views[1]);
                fvValuationForm.ChangeMode(FormViewMode.Edit);
                break;
            case "Readonly":
                mvAdjRequest.SetActiveView(mvAdjRequest.Views[1]);
                fvValuationForm.ChangeMode(FormViewMode.ReadOnly);

                break;
        }

        mvAdjRequest.SetActiveView(mvAdjRequest.Views[1]);
        fvValuationForm.ChangeMode(FormViewMode.Edit);




    }
    protected void ObjectDataSource1_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["ValFormParameter"] = Parameters;
        e.InputParameters.Remove("Values");
        e.InputParameters.Remove("ValuationFormId");

		// Check if the Verification is completed or not
		bool Verified = ((CheckBox) fvValuationForm.FindControl("chkVerified")).Checked;
		e.InputParameters["Verified"] = Verified;
		// Add the insert parameter
		e.InputParameters["AlertId"] = Request.Params["AlertId"];
	

    }
    protected void ddlTypeOfPropertyUpd_SelectedIndexChanged1(object sender, EventArgs e)
    {
        String PropertyType = ((DropDownList)fvValuationForm.FindControl("ddlTypeOfPropertyUpd")).SelectedItem.Text;
        switch (PropertyType)
        {
            case "Residencial":
                {
                    MultiView mvR = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvR.SetActiveView(mvR.Views[0]);
                    break;
                }
            case "Commercial":
                {
                    MultiView mvC = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvC.SetActiveView(mvC.Views[1]);
                    break;
                }
            case "Industrial":
                {

                    MultiView mvi = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvi.SetActiveView(mvi.Views[2]);
                    break;
                }
        }
    }

    protected void ddlTypeOfPropertyUpd_SelectedIndexChanged(object sender, EventArgs e)
    {
        String PropertyType = ((DropDownList)fvValuationForm.FindControl("ddlTypeOfPropertyUpd")).SelectedItem.Text;
        switch (PropertyType)
        {
            case "Residencial":
                {
                    MultiView mvR = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvR.SetActiveView(mvR.Views[0]);
                    break;
                }
            case "Commercial":
                {
                    MultiView mvC = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvC.SetActiveView(mvC.Views[1]);
                    break;
                }
            case "Industrial":
                {

                    MultiView mvi = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvi.SetActiveView(mvi.Views[2]);
                    break;
                }
        }
    }
    protected void fvValuationForm_DataBound(object sender, EventArgs e)
    {
        if (fvValuationForm.CurrentMode == FormViewMode.Edit)
        {

            Guid ValuationId = new Guid(fldValId.Value);

            ViewState["DocDetails"] = new AdjudicationRequest().GetDocumentByValuationFormId(ValuationId);
			GridView GvDocDetails = ((GridView) fvValuationForm.FindControl("gvDocumentUpd"));
            GvDocDetails.DataSource = ViewState["DocDetails"];
            GvDocDetails.DataBind();
        }

    }
    protected void fvValuationForm_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        mvAdjRequest.SetActiveView(mvAdjRequest.Views[0]);
        txtFileNo.Text = "";

        mvAdjRequest.SetActiveView(mvAdjRequest.Views[1]);
        if (e.Exception == null)
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }

    }
    

    #region  Document Master
    protected void AddDocumentDetails_Click(object sender, EventArgs e)
    {

        string Mode = "Ins";
        Guid ValuationFormId = Guid.Empty;
        if (null == ViewState["DocDetails"])
        {
            ViewState["DocDetails"] = new AdjudicationRequest().GetDocumentByValuationFormId(Guid.Empty);
            ValuationFormId = Guid.Empty;
        }
        if (fvValuationForm.CurrentMode == FormViewMode.Edit)
        {
            //TODO: Replace the Data Key Name here.
            ValuationFormId = (Guid)fvValuationForm.DataKey["ValuationFormId"];
            Mode = "Upd";
        }

        GridView gvDocDetails = ((GridView)fvValuationForm.FindControl("gvDocument" + Mode));
        DataTable dtDocDetails = (DataTable)ViewState["DocDetails"];
        DropDownList ddlDoc = ((DropDownList)fvValuationForm.FindControl("ddlDocumentType" + Mode));
        TextBox txtDocNumber = ((TextBox)fvValuationForm.FindControl("txtDocumentNumber" + Mode));
        TextBox txtDocRemarks = ((TextBox)fvValuationForm.FindControl("txtDocRemarks" + Mode));
        CheckBox chkSubmitted = ((CheckBox)fvValuationForm.FindControl("chkSubmitted" + Mode));
        object[] keys = { ValuationFormId, new Guid(ddlDoc.SelectedValue) };
        DataRow dr = dtDocDetails.Rows.Find(keys);

        if (null == dr)
        {
            dr = dtDocDetails.NewRow();
            dr["ValuationFormId"] = ValuationFormId;
            dr["DocumentTypeId"] = new Guid(ddlDoc.SelectedValue);
            dr["DocName"] = ddlDoc.SelectedItem.Text;
            dr["DocumentNumber"] = txtDocNumber.Text;
            dr["Remarks"] = txtDocRemarks.Text;
            dr["Submitted"] = chkSubmitted.Checked;
            dtDocDetails.Rows.Add(dr);
            ddlDoc.SelectedIndex = -1;
        }

        ((Button)fvValuationForm.FindControl("btnAddDocument" + Mode)).Visible = true;
        ((Button)fvValuationForm.FindControl("btnUpdateFeeDetails" + Mode)).Visible = false;

        ViewState["DocDetails"] = dtDocDetails;
        gvDocDetails.DataSource = (DataTable)ViewState["DocDetails"];
        gvDocDetails.DataBind();
        txtDocNumber.Text = "";
        txtDocRemarks.Text = "";
        chkSubmitted.Checked = false;

    }

    protected void UpdateDocDetails_Click(object sender, EventArgs e)
    {
        string Mode = "Ins";
        Guid ValuationFormId = Guid.Empty;
        if (null == ViewState["DocDetails"])
        {
            ViewState["DocDetails"] = new AdjudicationRequest().GetDocumentByValuationFormId(Guid.Empty);
            ValuationFormId = Guid.Empty;
        }
        if (fvValuationForm.CurrentMode == FormViewMode.Edit)
        {
            //TODO: Replace the Data Key Name here.
            ValuationFormId = (Guid)fvValuationForm.DataKey["ValuationFormId"];
            Mode = "Upd";
        }

        GridView gvDocDetails = ((GridView)fvValuationForm.FindControl("gvDocument" + Mode));
        DataTable dtDocDetails = (DataTable)ViewState["DocDetails"];
        DropDownList ddlDoc = ((DropDownList)fvValuationForm.FindControl("ddlDocumentType" + Mode));
        TextBox txtDocNumber = ((TextBox)fvValuationForm.FindControl("txtDocumentNumber" + Mode));
        TextBox txtDocRemarks = ((TextBox)fvValuationForm.FindControl("txtDocRemarks" + Mode));
        CheckBox chkSubmitted = ((CheckBox)fvValuationForm.FindControl("chkSubmitted" + Mode));
        object[] keys = { ValuationFormId, new Guid(ddlDoc.SelectedValue) };
        DataRow dr = dtDocDetails.Rows.Find(keys);
        if (null == dr)
        {
            keys[1] = gvDocDetails.SelectedDataKey["DocumentTypeId"];
            dr = dtDocDetails.Rows.Find(keys);
        }

        if (null != dr)
        {
            dr["DocumentTypeId"] = new Guid(ddlDoc.SelectedValue);
            dr["DocName"] = ddlDoc.SelectedItem.Text;
            dr["DocumentNumber"] = txtDocNumber.Text;
            dr["Remarks"] = txtDocRemarks.Text;
            dr["Submitted"] = chkSubmitted.Checked;
        }

        ((Button)fvValuationForm.FindControl("btnAddDocument" + Mode)).Visible = true;
        ((Button)fvValuationForm.FindControl("btnUpdateFeeDetails" + Mode)).Visible = false;

        gvDocDetails.DataSource = (DataTable)ViewState["DocDetails"];
        gvDocDetails.DataBind();
        gvDocDetails.SelectedIndex = -1;
        txtDocNumber.Text = "";
        txtDocRemarks.Text = "";
        chkSubmitted.Checked = false;
        ddlDoc.DataBind();
    }

    protected void DocDetailsGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Mode = "Ins";
        Guid ValuationFormId = Guid.Empty;
        if (null == ViewState["DocDetails"])
        {
            ViewState["DocDetails"] = new AdjudicationRequest().GetDocumentByValuationFormId(Guid.Empty);
            ValuationFormId = Guid.Empty;
        }
        if (fvValuationForm.CurrentMode == FormViewMode.Edit)
        {
            //TODO: Replace the Data Key Name here.
            ValuationFormId = (Guid)fvValuationForm.DataKey["ValuationFormId"];
            Mode = "Upd";
        }

        GridView gv = (GridView)sender;
        DataTable dt = (DataTable)ViewState["DocDetails"];
        GridView gvDocDetails = ((GridView)fvValuationForm.FindControl("gvDocumentIns" + Mode));
        DropDownList ddlDoc = ((DropDownList)fvValuationForm.FindControl("ddlDocumentType" + Mode));
        TextBox txtDocNumber = ((TextBox)fvValuationForm.FindControl("txtDocumentNumber" + Mode));
        TextBox txtDocRemarks = ((TextBox)fvValuationForm.FindControl("txtDocRemarks" + Mode));
        CheckBox chkSubmitted = ((CheckBox)fvValuationForm.FindControl("chkSubmitted" + Mode));
        object[] keys = new object[gv.SelectedDataKey.Values.Count];
        for (int i = 0; i < keys.Length; i++)
        {
            keys[i] = gv.SelectedDataKey.Values[i];
        }
        DataRow dr = dt.Rows.Find(keys);

        if (null != dr)
        {


            ddlDoc.SelectedValue = Convert.ToString(dr["DocumentTypeId"]);
            txtDocNumber.Text = (string)dr["DocumentNumber"];
            txtDocRemarks.Text = (string)dr["Remarks"];
            chkSubmitted.Checked = (bool)dr["Submitted"];

        }

        ((Button)fvValuationForm.FindControl("btnAddDocument" + Mode)).Visible = false;
        ((Button)fvValuationForm.FindControl("btnUpdateFeeDetails" + Mode)).Visible = true;

    }

    protected void DocDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Guid ValuationFormId = Guid.Empty;
        if (null == ViewState["DocDetails"])
        {
            ViewState["DocDetails"] = new AdjudicationRequest().GetDocumentByValuationFormId(Guid.Empty);
            ValuationFormId = Guid.Empty;
        }
        if (fvValuationForm.CurrentMode == FormViewMode.Edit)
        {
            ValuationFormId = (Guid)fvValuationForm.DataKey["ValuationFormId"];
        }
        GridView gv = (GridView)sender;
        DataTable dt = (DataTable)ViewState["DocDetails"];
        int i = e.RowIndex;
        dt.Rows[i].Delete();
        dt.AcceptChanges();
        ViewState["DocDetails"] = dt;
        gv.DataSource = ViewState["DocDetails"];
        gv.DataBind();
    }

    #endregion


    protected void btnbackToAdjudicationGrid_Click(object sender, EventArgs e)
    {
        mvAdjRequest.SetActiveView(mvAdjRequest.Views[0]);

    }
    protected void ddlTypeOfPropertyUpd_DataBound(object sender, EventArgs e)
    {
        String PropertyType = ((DropDownList)fvValuationForm.FindControl("ddlTypeOfPropertyUpd")).SelectedItem.Text;
        switch (PropertyType)
        {
            case "Residencial":
                {
                    MultiView mvR = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvR.SetActiveView(mvR.Views[0]);
                    break;
                }
            case "Commercial":
                {
                    MultiView mvC = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvC.SetActiveView(mvC.Views[1]);
                    break;
                }
            case "Industrial":
                {

                    MultiView mvi = ((MultiView)fvValuationForm.FindControl("mvPropertyDetailsUpd"));
                    mvi.SetActiveView(mvi.Views[2]);
                    break;
                }

        }

    }
    protected void ddlTypeOfPropertyItm_DataBound(object sender, EventArgs e)
    {
        String PropertyType = ((DropDownList)fvReadOnly.FindControl("ddlTypeOfPropertyItm")).SelectedItem.Text;
        switch (PropertyType)
        {
            case "Residencial":
                {
                    MultiView mvR = ((MultiView)fvReadOnly.FindControl("mvPropertyDetailsItm"));
                    mvR.SetActiveView(mvR.Views[0]);
                    break;
                }
            case "Commercial":
                {
                    MultiView mvC = ((MultiView)fvReadOnly.FindControl("mvPropertyDetailsItm"));
                    mvC.SetActiveView(mvC.Views[1]);
                    break;
                }
            case "Industrial":
                {

                    MultiView mvi = ((MultiView)fvReadOnly.FindControl("mvPropertyDetailsItm"));
                    mvi.SetActiveView(mvi.Views[2]);
                    break;
                }

        }

    }

    protected void ObjectDataSource1_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
		
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["ValFormParameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }

    protected void ddlOfficeIdIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "ADJ", Request.Params["Mode"]);
    }

    protected void ddlOfficeIdIns_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "ADJ", Request.Params["Mode"]);
    }

    protected void fvValuationForm_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
}
