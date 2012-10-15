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
using Resources;
using System.Collections.Generic;


public partial class Inspection_InspectionYearlySchedule : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Params["Mode"] != null)
            {
                switch (Request.Params["Mode"])
                {
                    case "InspectionYearlyScheduleDe":
                        MvYearlySchedule.SetActiveView(MvYearlySchedule.Views[1]);
                        break;
                    case "InspectionYearlySchedule":
                        MvYearlySchedule.SetActiveView(MvYearlySchedule.Views[0]);
                        break;
                }
            }
        }


	}
    
    //public void InitofficesAssigned()
    //{
    //    dtofficesSelected = (DataTable)Session["ActsApplicable"];
    //    if (dtofficesSelected == null)
    //    {
    //        dtofficesSelected = new DataTable();
    //        dtofficesSelected.Columns.Add("OfficeId", typeof(Guid));
    //        dtofficesSelected.Columns.Add("OfficeName", typeof(bool));
    //        dtofficesSelected.PrimaryKey = new DataColumn[] { dtActsApplicable.Columns["OfficeId"] };
    //    }
    //}

    protected void btnAddDetail_Click(object sender, EventArgs e)
    {
        string Mode = String.Empty;
        switch (FvYearlySchedule.CurrentMode)
        {
            case FormViewMode.Edit:
                Mode = "Upd";
                break;
            case FormViewMode.Insert:
                Mode="Ins";
                break;   
            case FormViewMode.ReadOnly:
                Mode="Itm";
                break;
            default:
                break;
        }
        string inspectionOffices = "";

        if (null == ViewState["ScheduleDetails"])
        {
            ViewState["ScheduleDetails"] = new Inspection().GetYearlyInspectionDetailsById(Guid.Empty);
        }

        // Check if office details already exist in the ViewState
        if (null == ViewState["SelectedOffices"])
        {
            // Create the Office Details schema
            DataTable SelectedOffices = new DataTable();
            SelectedOffices = new DataTable();
            SelectedOffices.Columns.Add("MonthlyScheduleId", typeof(Guid));
            SelectedOffices.Columns.Add("DetailScheduleId", typeof(Guid));
            SelectedOffices.Columns.Add("InspectingOfficeId", typeof(Guid));
            SelectedOffices.PrimaryKey = new DataColumn[] { SelectedOffices.Columns["MonthlyScheduleId"]};

            ViewState["SelectedOffices"] = SelectedOffices;
        }

        // Get the coltrols
        DataTable dtScheduleDetails = (DataTable)ViewState["ScheduleDetails"];
        DataTable dtOfficeDetails = (DataTable)ViewState["SelectedOffices"];
        GridView grdScheduleDetails = ((GridView)FvYearlySchedule.FindControl("GvInspectionDetails" + Mode));
        DropDownList ddlInspectionMonth = ((DropDownList)FvYearlySchedule.FindControl("ddlMonth" + Mode));
        ListBox lstInspectingOffice = ((ListBox)FvYearlySchedule.FindControl("lstInspectingOffice" + Mode));
        TextBox txtDetailRemarks = ((TextBox)FvYearlySchedule.FindControl("txtDetailRemarks" + Mode));

        // Create the DataRow to insert Yearly Schedule Details (each Month)
        DataRow drScheduleDetail = null;
        // Assign coluimn values
        Guid ScheduleId = Guid.Empty;
        Guid DetailScheduleId = Guid.NewGuid();
        drScheduleDetail = dtScheduleDetails.NewRow();
        drScheduleDetail["ScheduleId"] = ScheduleId;
        drScheduleDetail["DetailScheduleId"] = DetailScheduleId;
        drScheduleDetail["Month"] = Convert.ToDecimal(ddlInspectionMonth.SelectedValue);
        drScheduleDetail["Remarks"] = txtDetailRemarks.Text;

        // Get the selected offices
        foreach (ListItem Item in lstInspectingOffice.Items)
        {
            if (Item.Selected)
            {
                // Create the DataRow to insert Office details (each Office/Month)
                DataRow drOfficeDetail = null;
                drOfficeDetail = dtOfficeDetails.NewRow();
                drOfficeDetail["MonthlyScheduleId"] = Guid.NewGuid();
                drOfficeDetail["DetailScheduleId"] = DetailScheduleId;
                drOfficeDetail["InspectingOfficeId"] = Item.Value;

                // Generate the coma seperated text to display in the Grid
                inspectionOffices += Item.Text + ", ";
                dtOfficeDetails.Rows.Add(drOfficeDetail);
            }
        }
        // Remove the coma at the end of the string
        if (inspectionOffices.Length > 2)
        {
            inspectionOffices = inspectionOffices.Substring(0, inspectionOffices.Length - 2);
        }

        // Add the coma seperated text to the column value
        drScheduleDetail["OfficeName"] = inspectionOffices;
        // Add the row to the table
        dtScheduleDetails.Rows.Add(drScheduleDetail);

        // Store OfficeDetails and ScheduleDetails in ViewState
        ViewState["SelectedOffices"] = dtOfficeDetails;
        ViewState["ScheduleDetails"] = dtScheduleDetails;

        // Reset the Controls
        ddlInspectionMonth.SelectedIndex = -1;
        lstInspectingOffice.SelectedIndex = -1;
        txtDetailRemarks.Text = String.Empty;
        grdScheduleDetails.SelectedIndex = -1;

        // Bind the DataGrid
        grdScheduleDetails.DataSource = dtScheduleDetails;
        grdScheduleDetails.DataBind();
    }

    #region Commented Code
		
        //string Mode = "Ins";
        //Guid ScheduleId = Guid.Empty;

        //if (null == ViewState["ScheduleDetails"])
        //{
        //    ViewState["ScheduleDetails"] = new Inspection().GetYearlyInspectionDetailsById(Guid.Empty);

        //    ScheduleId = Guid.Empty;
        //}
        //if (null == ViewState["OfficeDetails"])
        //{
        //    ViewState["OfficeDetails"] = new Inspection().GetOfficesByScheduleId(Guid.Empty);
        //    ScheduleId = Guid.Empty;

        //}

        //if (FvYearlySchedule.CurrentMode == FormViewMode.Edit)
        //{
        //    ScheduleId = (Guid) FvYearlySchedule.DataKey["ScheduleId"];
        //    Mode = "Upd";
        //}

        //GridView GvInspectionDetails = ((GridView) FvYearlySchedule.FindControl("GvInspectionDetails" + Mode));
        //DataTable dtScheduleDetails = (DataTable) ViewState["ScheduleDetails"];
        //DataTable dtOfficeDetails = (DataTable) ViewState["OfficeDetails"];
        //DropDownList ddlMonth = ((DropDownList) FvYearlySchedule.FindControl("ddlMonth" + Mode));
        //ListBox lstInspectingOffice = ((ListBox) FvYearlySchedule.FindControl("lstInspectingOffice" + Mode));
        //TextBox txtDetailRemarks = ((TextBox) FvYearlySchedule.FindControl("txtDetailRemarks" + Mode));
        ////object[] keys =new object [GvInspectionDetails.SelectedDataKey.Values.Count];

        ////for (int i = 0; i < keys.Length; i++)
        ////{
        ////    keys[i] = GvInspectionDetails.SelectedDataKey.Values[i];
        ////}


        ////DataRow dr = dtScheduleDetails.Rows.Find(keys);

        ////if (null == dr)
        ////{
        //DataRow dr = dtScheduleDetails.NewRow();
        //dr["DetailScheduleId"] = Guid.NewGuid();
        //dr["ScheduleId"] = Guid.NewGuid();
        //dr["Month"] = Convert.ToDecimal(ddlMonth.SelectedValue);
        //dr["Remarks"] = txtDetailRemarks.Text;
        ////dr["OfficeName"] = (lstInspectingOffice.SelectedItem.Text);
        //string lstbox = "";
        //string lstboxComma="";

        //foreach (ListItem lst in lstInspectingOffice.Items)
        //{
        //    if (lst.Selected)
        //    {
        //        lstbox += lst.Text + ",";
        //        lstboxComma = lstbox.Substring(0, lstbox.Length - 1);
        //    }                
        //    lstboxComma = lstbox.Substring(0, lstbox.Length - 1);

        //}
        //dr["OfficeName"] = lstboxComma;



        ////dr["OfficeName"] = lstbox;

        ////dr["OfficeName"] = lstbox;

        ////    DataRow dr1 = dtOfficeDetails.NewRow();



        ////    dr1["OfficeId"] = new Guid(lstInspectingOffice.SelectedValue);
        ////    DataTable dttbl = new DataTable();


        ////    dttbl.Columns.Add("DetailScheduleId", typeof(Guid));
        ////    dttbl.Columns.Add("ScheduleId", typeof(Guid));
        ////    dttbl.Columns.Add("Month", typeof(decimal));
        ////    dttbl.Columns.Add("Remarks", typeof(string));
        ////    dttbl.Columns.Add("OfficeId", typeof(Guid));

        ////    dttbl.Columns["DetailScheduleId"] = dr["DetailScheduleId"];
        ////    dttbl.Columns["ScheduleId"] = dr["ScheduleId"];
        ////    dttbl.Columns["Month"] = dr["Month"];
        ////    dttbl.Columns["Remarks"] = dr["Remarks"];
        ////    dttbl.Columns["OfficeId"] = dr1["OfficeId"];
        ////DataSet ds = new DataSet();
        ////ds.Tables.Add(dttbl);
        ////GvInspectionDetails.DataSource = ds.Tables[0];
        ////GvInspectionDetails.DataBind();


        //dtScheduleDetails.Rows.Add(dr);
        ////ddlMonth.SelectedIndex = -1;
        ////txtDetailRemarks.Text = "";

        ////}

        ////((Button) FvYearlySchedule.FindControl("btnAddDetail" + Mode)).Visible = true;
        ////((Button) FvYearlySchedule.FindControl("btnUpdatePurchaseDetails" + Mode)).Visible = false;

        //ViewState["ScheduleDetails"] = dtScheduleDetails;
        //GvInspectionDetails.DataSource = (DataTable) ViewState["ScheduleDetails"];
        //GvInspectionDetails.DataBind();


	#endregion	}

    protected void GvInspectionDetailsIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Mode = String.Empty;
        switch (FvYearlySchedule.CurrentMode)
        {
            case FormViewMode.Edit:
                Mode = "Upd";
                break;
            case FormViewMode.Insert:
                Mode = "Ins";
                break;
            case FormViewMode.ReadOnly:
                Mode = "Itm";
                break;
            default:
                break;
        }

        // Declare the varioables and get reference to the controls
        Guid ScheduleId = Guid.Empty;
        GridView gvInspectionDetails = ((GridView)FvYearlySchedule.FindControl("GvInspectionDetails" + Mode));
        DropDownList ddlMonth = ((DropDownList)FvYearlySchedule.FindControl("ddlMonth" + Mode));
        ListBox lstInspectingOffice = ((ListBox)FvYearlySchedule.FindControl("lstInspectingOffice" + Mode));
        TextBox txtDetailRemarks = ((TextBox)FvYearlySchedule.FindControl("txtDetailRemarks" + Mode));

        if (null == ViewState["ScheduleDetails"])
        {
            ViewState["ScheduleDetails"] = new Inspection().GetYearlyInspectionDetailsById(Guid.Empty);
            ScheduleId = Guid.Empty;
        }
        if (FvYearlySchedule.CurrentMode == FormViewMode.Edit)
        {
            if (null == ViewState["SelectedOffices"])
            {
                ViewState["SelectedOffices"] = new Inspection().GetMonthlyInspectionScheduleByDetailScheduleId((Guid)gvInspectionDetails.SelectedDataKey.Value);
            }
            ScheduleId = (Guid)FvYearlySchedule.DataKey["ScheduleId"];
        }

        DataTable dtScheduleDetails = (DataTable)ViewState["ScheduleDetails"];
        DataTable dtOfficeDetails = (DataTable)ViewState["SelectedOffices"];

        object[] keys = { gvInspectionDetails.SelectedDataKey.Value };
        DataRow drScheduleDetail = dtScheduleDetails.Rows.Find(keys);
        Guid DetailScheduleId = (Guid)drScheduleDetail["DetailScheduleId"];

        if (null != drScheduleDetail)
        {
            ddlMonth.SelectedValue = Convert.ToString(drScheduleDetail["Month"]);
            txtDetailRemarks.Text = Convert.ToString(drScheduleDetail["Remarks"]);

            // Find and select each of the Offices
            lstInspectingOffice.ClearSelection();
            foreach (DataRow row in dtOfficeDetails.Rows)
            {
                if (DetailScheduleId.Equals(row["DetailScheduleId"]))
                    lstInspectingOffice.Items.FindByValue(row["InspectingOfficeId"].ToString()).Selected = true;
            }
        }

        // Show appropriate buttons
        ((Button)FvYearlySchedule.FindControl("btnAddInspectionDetail" + Mode)).Visible = false;
        ((Button)FvYearlySchedule.FindControl("btnUpdateInspectionDetail" + Mode)).Visible = true;

    }

    //protected void GvInspectionDetailsIns_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string Mode=String.Empty;
    //    switch (FvYearlySchedule.CurrentMode)
    //    {
    //        case FormViewMode.Edit:
    //            Mode = "Upd";
    //            break;
    //        case FormViewMode.Insert:
    //            Mode = "Ins";
    //            break;
    //        case FormViewMode.ReadOnly:
    //            Mode = "Itm";
    //            break;
    //        default:
    //            break;
    //    }

    //    // Declare the varioables and get reference to the controls
    //    Guid ScheduleId = Guid.Empty;
    //    GridView gvInspectionDetails = ((GridView) FvYearlySchedule.FindControl("GvInspectionDetails" + Mode));
    //    DropDownList ddlMonth = ((DropDownList) FvYearlySchedule.FindControl("ddlMonth" + Mode));
    //    ListBox lstInspectingOffice = ((ListBox) FvYearlySchedule.FindControl("lstInspectingOffice" + Mode));
    //    TextBox txtDetailRemarks = ((TextBox) FvYearlySchedule.FindControl("txtDetailRemarks" + Mode));

    //    if (null == ViewState["ScheduleDetails"])
    //    {
    //        ViewState["ScheduleDetails"] = new Inspection().GetYearlyInspectionDetailsById(Guid.Empty);
    //        ScheduleId = Guid.Empty;
    //    }
    //    if (FvYearlySchedule.CurrentMode == FormViewMode.Edit)
    //    {
    //        if (null == ViewState["SelectedOffices"])
    //        {
    //            ViewState["SelectedOffices"] = new Inspection().GetMonthlyInspectionScheduleByDetailScheduleId((Guid)gvInspectionDetails.SelectedDataKey.Value);
    //        }
    //        ScheduleId = (Guid)FvYearlySchedule.DataKey["ScheduleId"];
    //    }

    //    DataTable dtScheduleDetails = (DataTable) ViewState["ScheduleDetails"];
    //    DataTable dtOfficeDetails = (DataTable) ViewState["SelectedOffices"];

    //    object[] keys = { gvInspectionDetails.SelectedDataKey.Value };
    //    DataRow drScheduleDetail = dtScheduleDetails.Rows.Find(keys);
    //    Guid DetailScheduleId = (Guid)drScheduleDetail["DetailScheduleId"];

    //    if (null != drScheduleDetail)
    //    {
    //        ddlMonth.SelectedValue = Convert.ToString(drScheduleDetail["Month"]);
    //        txtDetailRemarks.Text = Convert.ToString(drScheduleDetail["Remarks"]);

    //        // Find and select each of the Offices
    //        lstInspectingOffice.ClearSelection();
    //        foreach (DataRow row in dtOfficeDetails.Rows)
    //        {
    //            if (DetailScheduleId.Equals(row["DetailScheduleId"]))
    //                lstInspectingOffice.Items.FindByValue(row["InspectingOfficeId"].ToString()).Selected = true;
    //        }
    //    }

    //    ((Button) FvYearlySchedule.FindControl("btnAddInspectionDetail" + Mode)).Visible = false;
    //    ((Button) FvYearlySchedule.FindControl("btnUpdateInspectionDetail" + Mode)).Visible = true;


    //}

    protected void GvInspectionDetailsIns_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Guid ScheduleId = Guid.Empty;
        if (null == ViewState["ScheduleDetails"])
        {
            ViewState["ScheduleDetails"] = new Inspection().GetYearlyInspectionDetailsById(Guid.Empty);
            ScheduleId = Guid.Empty;
        }
        if (FvYearlySchedule.CurrentMode == FormViewMode.Edit)
        {
            ScheduleId = (Guid)FvYearlySchedule.DataKey["ScheduleId"];
        }

        GridView GvInspectionDetails = (GridView)sender;
        DataTable dtScheduleDetails = (DataTable)ViewState["ScheduleDetails"];
        int i = e.RowIndex;
        dtScheduleDetails.Rows[i].Delete();
        dtScheduleDetails.AcceptChanges();

        ViewState["ScheduleDetails"] = dtScheduleDetails;
        GvInspectionDetails.DataSource = ViewState["ScheduleDetails"];
        GvInspectionDetails.DataBind();


    }
	
    protected void btnUpdateInspectionDetail_Click(object sender, EventArgs e)
	{
        string Mode=String.Empty;
        switch (FvYearlySchedule.CurrentMode)
        {
            case FormViewMode.Edit:
                Mode = "Upd";
                break;
            case FormViewMode.Insert:
                Mode = "Ins";
                break;
            case FormViewMode.ReadOnly:
                Mode = "Itm";
                break;
            default:
                break;
        }
        string inspectionOffices = "";

        if (null == ViewState["ScheduleDetails"])
        {
            ViewState["ScheduleDetails"] = new Inspection().GetYearlyInspectionDetailsById(Guid.Empty);
        }

        // Check if office details already exist in the ViewState
        if (null == ViewState["SelectedOffices"])
        {
            // Create the Office Details schema
            DataTable SelectedOffices = new DataTable();
            SelectedOffices = new DataTable();
            SelectedOffices.Columns.Add("MonthlyScheduleId", typeof(Guid));
            SelectedOffices.Columns.Add("DetailScheduleId", typeof(Guid));
            SelectedOffices.Columns.Add("InspectingOfficeId", typeof(Guid));
            SelectedOffices.PrimaryKey = new DataColumn[] { SelectedOffices.Columns["MonthlyScheduleId"] };

            ViewState["SelectedOffices"] = SelectedOffices;
        }

        // Get the coltrols
        DataTable dtScheduleDetails = (DataTable)ViewState["ScheduleDetails"];
        DataTable dtOfficeDetails = (DataTable)ViewState["SelectedOffices"];
        GridView grdScheduleDetails = ((GridView)FvYearlySchedule.FindControl("GvInspectionDetails" + Mode));
        DropDownList ddlInspectionMonth = ((DropDownList)FvYearlySchedule.FindControl("ddlMonth" + Mode));
        ListBox lstInspectingOffice = ((ListBox)FvYearlySchedule.FindControl("lstInspectingOffice" + Mode));
        TextBox txtDetailRemarks = ((TextBox)FvYearlySchedule.FindControl("txtDetailRemarks" + Mode));

        // Get the DataRow to update Yearly Schedule Details (each Month)
        Guid ScheduleId = Guid.Empty;
        object[] keys = { grdScheduleDetails.SelectedDataKey.Value };
        DataRow drScheduleDetail = dtScheduleDetails.Rows.Find(keys);
        Guid DetailScheduleId = (Guid)drScheduleDetail["DetailScheduleId"];
        
        // Assign coluimn values
        drScheduleDetail["ScheduleId"] = ScheduleId;
        drScheduleDetail["DetailScheduleId"] = DetailScheduleId;
        drScheduleDetail["Month"] = Convert.ToDecimal(ddlInspectionMonth.SelectedValue);
        drScheduleDetail["Remarks"] = txtDetailRemarks.Text;

        
        // Delete the existing Ofice details
        DataRow[] OfficeDetailToDelete = dtOfficeDetails.Select("DetailScheduleId = '" + DetailScheduleId + "'");
        for (int i = 0; i < OfficeDetailToDelete.Length; i++)
        {
            OfficeDetailToDelete[i].Delete();
        }
        
        // Get the newly selected offices
        foreach (ListItem Item in lstInspectingOffice.Items)
        {
            if (Item.Selected)
            {
                // Create the DataRow to insert Office details (each Office/Month)
                DataRow drOfficeDetail = null;
                drOfficeDetail = dtOfficeDetails.NewRow();
                drOfficeDetail["MonthlyScheduleId"] = Guid.NewGuid();
                drOfficeDetail["DetailScheduleId"] = DetailScheduleId;
                drOfficeDetail["InspectingOfficeId"] = Item.Value;

                // Generate the coma seperated text to display in the Grid
                inspectionOffices += Item.Text + ", ";
                dtOfficeDetails.Rows.Add(drOfficeDetail);
            }
        }
        // Remove the coma at the end of the string
        if (inspectionOffices.Length > 2)
        {
            inspectionOffices = inspectionOffices.Substring(0, inspectionOffices.Length - 2);
        }

        // Add the coma seperated text to the column value
        drScheduleDetail["OfficeName"] = inspectionOffices;
        // Add the row to the table
        // dtScheduleDetails.Rows.Add(drScheduleDetail);

        // Store OfficeDetails and ScheduleDetails in ViewState
        ViewState["SelectedOffices"] = dtOfficeDetails;
        ViewState["ScheduleDetails"] = dtScheduleDetails;

        // Bind the DataGrid
        grdScheduleDetails.DataSource = dtScheduleDetails;
        grdScheduleDetails.DataBind();
        grdScheduleDetails.SelectedIndex = -1;

        // Reset the Controls
        ddlInspectionMonth.SelectedIndex = -1;
        lstInspectingOffice.SelectedIndex = -1;
        txtDetailRemarks.Text = String.Empty;
        grdScheduleDetails.SelectedIndex = -1;

        // Show appropriate buttons
        ((Button)FvYearlySchedule.FindControl("btnAddInspectionDetail" + Mode)).Visible = true;
		((Button) FvYearlySchedule.FindControl("btnUpdateInspectionDetail" + Mode)).Visible = false;



	}
	
    protected void OdsFvInspection_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

	}
	
    protected void FvYearlySchedule_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, Inspection.GetYearlyInspectionRow());
        DataTable SelectedOffices = (DataTable)ViewState["SelectedOffices"];
		DataTable ScheduleDetails = (DataTable) ViewState["ScheduleDetails"];
		e.Values.Add("ScheduleDetails", ScheduleDetails);
        e.Values.Add("SelectedOffices", SelectedOffices);

	}
    
    protected void FvYearlySchedule_DataBound(object sender, EventArgs e)
    {
        if (FvYearlySchedule.CurrentMode == FormViewMode.Edit)
        {
            // Get the Yearly Schedule Id
            Guid ScheduleId = (Guid)GvYearlyInspection.SelectedDataKey.Values["ScheduleId"];
            // Get the Monthly schedule details for the selected Schedule
            Inspection objInspection = new Inspection();
            DataTable dtScheduleDetails = objInspection.GetYearlyInspectionDetailsById(ScheduleId);
            DataTable dtOfficeDetails = new Inspection().GetMonthlyInspectionScheduleByDetailScheduleId(ScheduleId);
            string officeNames = "";
            // Get the selected Offices
            if (dtScheduleDetails.Rows.Count > 0)
            {
                foreach (DataRow drScheduleDetail in dtScheduleDetails.Rows)
                {
                    officeNames = "";
                    DataRow[] drOfficeDetail = dtOfficeDetails.Select("DetailScheduleId='" + drScheduleDetail["DetailScheduleId"].ToString() + "'");
                    for (int i = 0; i < drOfficeDetail.Length; i++)
                    {
                        officeNames += Convert.ToString(drOfficeDetail[i]["OfficeName"]) + ", ";
                    }
                    // Remove the coma at the end of the string
                    if (officeNames.Length > 2)
                    {
                        officeNames = officeNames.Substring(0, officeNames.Length - 2);
                    }
                    drScheduleDetail["OfficeName"] = officeNames;
                }

                ViewState["ScheduleDetails"] = dtScheduleDetails;
                ViewState["SelectedOffices"] = dtOfficeDetails;

                GridView grd = (GridView)FvYearlySchedule.FindControl("GvInspectionDetailsUpd");
                grd.DataSource = dtScheduleDetails;
                grd.SelectedIndex = -1;
                grd.DataBind();
            }
        }
    }

	protected void GvYearlyInspection_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvYearlySchedule.SetActiveView(MvYearlySchedule.Views[1]);
		FvYearlySchedule.ChangeMode(FormViewMode.Edit);

	}

	protected void FvYearlySchedule_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	}
    
    protected void FvYearlySchedule_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    
    protected void FvYearlySchedule_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
		Global.SetFormViewParameters(e.NewValues, Inspection.GetYearlyInspectionRow());
        DataTable SelectedOffices = (DataTable)ViewState["SelectedOffices"];
		DataTable ScheduleDetails = (DataTable) ViewState["ScheduleDetails"];
        e.NewValues.Add("ScheduleDetails", ScheduleDetails);
        e.NewValues.Add("SelectedOffices", SelectedOffices);

    }
    
    protected void OdsFvInspection_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

    }
}
