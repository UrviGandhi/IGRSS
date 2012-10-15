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
using System.Threading;
using System.ComponentModel;
using Resources;
using IGRSS.BusinessObjects;
public partial class Appeal_AppealApplication : IgrssPage
{
	DataTable dtAct = new DataTable();
	DataTable dtVendorDtl = new DataTable();
	public void InitAct()
	{
		//Storing ViewState values into Datatable.
		dtAct = (DataTable) ViewState["dtAct"];
		if (dtAct == null)
		{
			//Creating new DataTable.
			dtAct = new DataTable();
			//Adding Columns to the DataTable
			dtAct.Columns.Add("ActId", typeof(Guid));
			dtAct.Columns.Add("Checked", typeof(bool));
		}
	}
	AppealApplication objAppeal = new AppealApplication();
	protected void Page_Load(object sender, EventArgs e)
    {
        FileManagement_FileForward ffc = (FileManagement_FileForward)fvAppeal.FindControl("FileForward1");
		if (Page.IsPostBack==false)
		{
			if (Request.Params["AlertId"] != null)
			{
				IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
				ViewState["AlertId"] = alert.AlertId;
                fldAppealApplicationId.Value = alert.SessionData["FileId"].ToString();
               
                ffc.FileId = new Guid(fldAppealApplicationId.Value);
			}
            if (Request.Params["RedirID"] != null)
            {
                fldAppealApplicationId.Value = Request.Params["RedirID"].ToString();
                mvAppealType.SetActiveView(mvAppealType.Views[2]);
                fvReadOnly.ChangeMode(FormViewMode.ReadOnly);
                ((Label)fvReadOnly.FindControl("lblFileNo")).Text=FileManager.GetFileNo(new Guid(fldAppealApplicationId.Value));
            }
			switch (Request.Params["Mode"])
			{
				case "DataEntry":
					mvAppealType.SetActiveView(mvAppealType.Views[1]);
					fvAppeal.ChangeMode(FormViewMode.Insert);
					break;
				case "Verify":
					mvAppealType.SetActiveView(mvAppealType.Views[1]);
                    fvAppeal.ChangeMode(FormViewMode.Edit);
                    //((Label)fvAppeal.FindControl("lblaplFileNo")).Text = FileManager.GetFileNo(new Guid(fldAppealApplicationId.Value));
					break;
				case "Approve":
					mvAppealType.SetActiveView(mvAppealType.Views[1]);
                    fvAppeal.ChangeMode(FormViewMode.ReadOnly);
                    //((Label)fvAppeal.FindControl("lblFileNoRO")).Text = FileManager.GetFileNo(new Guid(fldAppealApplicationId.Value));
                    break;
				case "ReadOnly":
					mvAppealType.SetActiveView(mvAppealType.Views[2]);
					break;
			}
			Session["Mode"] = Request.Params["Mode"];
            
       
        }
        if (Request.Params["AlertId"] != null)
        {
            //if (Request.Params["Mode"].ToString() == "Approve")
            //{
            //    FileManagement_FileForward ffc3 = (FileManagement_FileForward)fvAppeal.FindControl("FileForward3");
            //    IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
            //    fldAppealApplicationId.Value = alert.SessionData["AppealId"].ToString();
            //    ffc3.FileId = new Guid(fldAppealApplicationId.Value);
            //}
            //else
            //{
                IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
                fldAppealApplicationId.Value = alert.SessionData["FileId"].ToString();
                ffc.FileId = new Guid(fldAppealApplicationId.Value);
            //}
        }
	}
	protected void gvAppeal_SelectedIndexChanged(object sender, EventArgs e)
	{
		fldAppealApplicationId.Value = gvAppeal.SelectedDataKey.Value.ToString();
		switch ((string) Session["Mode"])
		{
			case "Verify":
				{
					mvAppealType.SetActiveView(mvAppealType.Views[1]);
					fvAppeal.ChangeMode(FormViewMode.Edit);
					break;
				}
			case "Approve":
				{
					mvAppealType.SetActiveView(mvAppealType.Views[1]);
					fvAppeal.ChangeMode(FormViewMode.ReadOnly);
					break;
				}
			case "ReadOnly":
				{
					mvAppealType.SetActiveView(mvAppealType.Views[2]);
					fvReadOnly.ChangeMode(FormViewMode.ReadOnly);
					break;
				}
		}
	
		
	}
	protected void fvAppeal_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	}
	protected void fvAppeal_ItemCommand(object sender, FormViewCommandEventArgs e)
	{
		//Checking the Command Name and Calling the Method of the BLL.
		if (e.CommandName == "ApproveAppealApplication")
		{
			//Getting the selected DataKey of the GridView into Variable.
			Guid AppealId = new Guid(fldAppealApplicationId.Value.ToString());
			//Calling the Method of the BLL.
			objAppeal.ApproveAppealApplication(AppealId, (Guid) ViewState["AlertId"]);
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
          
            //((IGRSS_Default)this.Master).ShowStatusMessage("Application Approved", "The Application has been Approved", MessageType.Success);
           
            Response.Redirect("~/Default.aspx");
             
		}
		if (e.CommandName == "RejectAppealApplication")
		{
			//Getting the selected DataKey of the GridView.
            Guid licID = new Guid(fldAppealApplicationId.Value.ToString());
			//Calling the Method of the BLL.
			objAppeal.RejectAppealApplication(licID);
            WorkflowSupport.DeleteAlert(new Guid(ViewState["AlertId"].ToString()));
              ((IGRSS_Default)this.Master).ShowStatusMessage("Application Rejected", "The Application has been rejeced", MessageType.Success);
              Response.Redirect("~/Default.aspx");
            
		}
	}
	protected void btnNewRegistration_Click(object sender, EventArgs e)
	{
		mvAppealType.SetActiveView(mvAppealType.Views[1]);
		fvAppeal.ChangeMode(FormViewMode.Insert);
	}
	protected void fvAppeal_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		//Storing ViewState values into DataTable.
		dtAct = (DataTable) ViewState["dtAct"];
		Global.SetFormViewParameters(e.Values, AppealApplication.GetRow());
		//Calling InitAct Method
		InitAct();
		//Getting all the selected value of the ListBox and Storing into Datatable.
		foreach (ListItem li in ((ListBox) fvAppeal.FindControl("liAppealAct")).Items)
		{
			if(li.Selected)
			dtAct.Rows.Add(li.Value,li.Selected);
		}
		e.Values.Add("dtAct", dtAct);
        //Code Added By Akhilesh.
        FileManagement_FileForward ffc = (FileManagement_FileForward)fvAppeal.FindControl("FileForward1");
        Remarks rem = new Remarks();
        rem.Subject = ((TextBox)ffc.FindControl("txtRemarkSubject")).Text;
        rem.Body = ((TextBox)ffc.FindControl("txtRemarkBody")).Text;
        e.Values.Add("rem", rem);
 	
	}
	protected void odsAppealApplication_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	protected void odsAppealApplication_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;

		// Check if the Verification is completed or not
		bool Verified = ((CheckBox) fvAppeal.FindControl("chkVerified")).Checked;
		e.InputParameters["Verified"] = Verified;
		// Add the insert parameter
		e.InputParameters["AlertId"] = Request.Params["AlertId"];
		// Remove the Values parameter since it is not nesseray any more
		e.InputParameters.Remove("Values");
        //e.InputParameters.Add("AlertId", (Guid) ViewState["AlertId"]);
	}
	protected void fvAppeal_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		//Storing ViewState values into DataTable.
		dtAct = (DataTable) ViewState["dtAct"];
		Global.SetFormViewParameters(e.NewValues, AppealApplication.GetRow());
		//Calling InitAct Method
		InitAct();
		//Getting all the selected value of the ListBox and Storing into Datatable.
		foreach (ListItem li in ((ListBox) fvAppeal.FindControl("liActUpd")).Items)
		{
			if (li.Selected)
				dtAct.Rows.Add(li.Value, li.Selected);
		}
		e.NewValues.Add("dtAct", dtAct);
		e.NewValues.Add("AlertId", (Guid) ViewState["AlertId"]);

	}
	protected void btnSearch_Click(object sender, EventArgs e)
	{
        //if (txtAppealNo.Text == "" && txtAppliCantName.Text != "")
        //{
        //    dtVendorDtl=objAppeal.GetAppealApplicationByApplicantName(txtAppliCantName.Text);
        //    gvAppeal.DataSource = dtVendorDtl;
        //    gvAppeal.DataBind();
        //}
        //else if (txtAppliCantName.Text == "" && txtAppealNo.Text != "")
        //{
        //    dtVendorDtl=objAppeal.GetAppealApplicationByAppealNo(Convert.ToDecimal(txtAppealNo.Text));
        //    gvAppeal.DataSource=dtVendorDtl;
        //    gvAppeal.DataBind();
        //}
        //else
        //{
        //    dtVendorDtl=objAppeal.GetAllAppealApplication();
        //    gvAppeal.DataSource=dtVendorDtl;
        //    gvAppeal.DataBind();
        //}
        //txtAppliCantName.Text = "";
        //txtAppealNo.Text = "";
	}
    protected void fvAppeal_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        //mvAppealType.SetActiveView(mvAppealType.Views[0]);
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
	protected void fvReadOnly_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	}
	protected void txtInwardDateIns_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvAppeal.FindControl("txtInwardDateIns");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtInwardDateItm_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtInwardDateItm_DataBinding(object sender, EventArgs e)
	{
        //TextBox txt = (TextBox) fvAppeal.FindControl("txtInwardDateItm");
        //if (txt.Text != "")
        //{
        //    DateTime s = Convert.ToDateTime(txt.Text);
        //    txt.Text = s.ToString("dd/MM/yyyy");

        //}
	}
	protected void gvAppeal_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvAppeal.PageIndex = e.NewPageIndex;
		

	}
	protected void odsGetApplicantDtl_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
	{
		
	}
	protected void txtCreatedAt_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvReadOnly.FindControl("txtCreatedAt");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtModifiedAt_TextChanged(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvReadOnly.FindControl("txtModifiedAt");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtInwardDateItm_DataBinding1(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvReadOnly.FindControl("txtInwardDateItm");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
    protected void liAppealActItm_DataBinding(object sender, EventArgs e)
    {

    }
    protected void liActUpd_DataBound(object sender, EventArgs e)
    {
        Guid id = (Guid)fvAppeal.DataKey.Value;
        DataTable dtAct = objAppeal.GetActDetailByApppealId(id);
        ListBox list = (ListBox)fvAppeal.FindControl("liActUpd");
        foreach (DataRow dr in dtAct.Rows)
        {
            list.Items.FindByValue(((string)dr["ActId"].ToString())).Selected = true;
        }
    }
	protected void fvAppeal_Load(object sender, EventArgs e)
	{
        string Mode = "";
        switch (((FormView)sender).CurrentMode)
        {
            case FormViewMode.Edit:
                Mode = "Upd";
                break;
            case FormViewMode.Insert:
                Mode = "Ins";
                CheckBox chkAssignEnquiry = ((CheckBox)fvAppeal.FindControl("chkIsPaidAppealFeeIns"));
                if (chkAssignEnquiry.Checked != null)
                {
                    chkAssignEnquiry.Attributes.Add("onClick", "ShowAppealFeesDetails('" + chkAssignEnquiry.ClientID + "'");
                }
                break;
            case FormViewMode.ReadOnly:
                Mode = "Itm";
                break;
            default:
                break;
        }
        string curUser = Thread.CurrentPrincipal.Identity.Name;
        OfficeMaster UserOffice = new OfficeMaster();
        //DropDownList ddlOfficeName = (DropDownList)((FormView)sender).FindControl("ddlOfficeId" + Mode);
        //Profile.Permissions.FillOffices(ddlOfficeName, "APL", Request.Params["Mode"]);
        
		
	}
    protected void ddlOfficeIdIns_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "APL", Request.Params["Mode"]);
    }
    protected void ddlOfficeIdIns_Load1(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "APL", Request.Params["Mode"]);
    }
  
    protected void fvAppeal_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        
    }
    protected void fvAppeal_ItemInserted1(object sender, FormViewInsertedEventArgs e)
    {
        //if (e.Exception == null)
        //{
        //    if (Equals(e.ReturnValue, true))
        //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
        //    else
        //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Document No already Exists!", MessageType.Error);

        //}
        //else
        //{
        //    ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        //}
       
    }
    protected void ddlTypeOfAppealIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl=(DropDownList)fvAppeal.FindControl("ddlTypeOfAppealIns");
        MultiView mv = ((MultiView)fvAppeal.FindControl("viewAppealType"));
        switch (ddl.SelectedItem.Text)

        {
             case "Stamp":
                 
            mv.SetActiveView(mvAppealType.Views[1]);
            break;
      
            case "Registartion":
        
            mv.SetActiveView(mvAppealType.Views[0]);
            break;
        
        }
    }
    protected void odsAppealApplication_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
       
    }
    protected void odsAppealApplication_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Document No already Exists!", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }

    protected void chkIsPaidAppealFeeIns_Load(object sender, EventArgs e)
    {
        CheckBox chkAssignEnquiry = ((CheckBox)fvAppeal.FindControl("chkIsPaidAppealFeeIns"));
        
        if (chkAssignEnquiry.Checked != null)
        {
            chkAssignEnquiry.Attributes.Add("onClick", "ShowAppealFeesDetails('" + chkAssignEnquiry.ClientID + "')");
        }
    }
    //protected void txtApplicationStatus_DataBinding(object sender, EventArgs e)
    //{
    //    TextBox txt = (TextBox)fvReadOnly.FindControl("txtApplicationStatus");
    //    if (txt.Text == "In")
    //    {

    //        txt.Text = "Application In Progress";

    //    }
    //    if (txt.Text == "Approve")
    //    {

    //        txt.Text = "Application Approved";

    //    }
    //    if (txt.Text == "Reject")
    //    {

    //        txt.Text = "Application Rejected";

    //    }
    //}
    protected void lblReceiptDateIns_Load(object sender, EventArgs e)
    {

    }
    protected void txtInwardDateIns_Load(object sender, EventArgs e)
    {
       
        //TextBox tx=(TextBox)fvAppeal.FindControl("txtInwardDateIns");
        //        tx.Text=DateTime.Now.ToString();
    }
    protected void txtReceiptDateIns_Load(object sender, EventArgs e)
    {
        //TextBox tx = (TextBox)fvAppeal.FindControl("txtReceiptDateIns");
        //tx.Text = DateTime.Now.ToString();
    }
    protected void txtReceiptDateIns_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtReceiptDateIns_DataBinding(object sender, EventArgs e)
    {
        TextBox tx = (TextBox)fvAppeal.FindControl("txtReceiptDateIns");
        tx.Text = DateTime.Now.ToString();
    }
    protected void txtApplicationStatus_DataBinding(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)fvReadOnly.FindControl("txtApplicationStatus");
        string s = txt.Text;
        if (s.Trim()=="In")
        {
           
            txt.Text = "Application In Progress";

        }
        if (s.Trim() == "Approve")
        {

            txt.Text = "Application Approved";

        }
        if (s.Trim() == "Reject")
        {

            txt.Text = "Application Rejected";

        }
    }
    protected void gvHearingDetails_DataBound(object sender, EventArgs e)
    {
        
        foreach (GridViewRow gr in ((GridView)fvReadOnly.FindControl("gvHearingDetails")).Rows)
        {

            if (gr.Cells[2].Text == Convert.ToString(true))


                gr.Cells[2].Text = "Hearing Completed";
            else
                gr.Cells[2].Text = "";
        }
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in ((GridView)fvReadOnly.FindControl("GridView1")).Rows)
        {

            if (gr.Cells[2].Text == Convert.ToString(true))


                gr.Cells[2].Text = "Hearing Completed";
            else
                gr.Cells[2].Text = "";
        }
    }
}
