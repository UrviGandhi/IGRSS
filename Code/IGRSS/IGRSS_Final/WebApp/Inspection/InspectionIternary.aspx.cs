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
using RJS.Web.WebControl;

public partial class Inspection_InspectionIternary : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MvInspectionIternary.SetActiveView(MvInspectionIternary.Views[4]);
        }
    }
    protected void GvInspectionIternaryView_SelectedIndexChanged(object sender, EventArgs e)
    {


    }
    protected void OdsIternaryById_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");



    }
    protected void FvInspectionIternary_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        Global.SetFormViewParameters(e.Values, Inspection.GetInspectionItenaryRow());
        e.Values.Add("ScheduleId", new Guid(fldScheduleId.Value));
    }
    protected void GvInspectionIternary_SelectedIndexChanged(object sender, EventArgs e)
    {
        MvInspectionIternary.SetActiveView(MvInspectionIternary.Views[3]);
        FvInspectionItenaryReadOnly.ChangeMode(FormViewMode.ReadOnly);
    }
    protected void OdsIternaryById_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
        //Global.SetFormViewParameters(e.Values, Inspection.GetInspectionItenaryRow());
        //e.Values.Add("ScheduleId", new Guid(GvInspectionIternaryView.SelectedDataKey.Value.ToString()));
    }
    protected void FvInspectionIternary_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Global.SetFormViewParameters(e.NewValues, Inspection.GetInspectionItenaryRow());
        e.NewValues.Add("ItenaryId", Session["ItenaryId"].ToString());
        e.NewValues.Add("ScheduleId", new Guid(GvYearlyInspection.SelectedDataKey.Value.ToString()));

    }
    protected void ddlInspectingOfficeIns_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "IPS", Request.Params["Mode"]);
    }
    protected void ddlUpdpectingOfficeUpd_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "IPS", Request.Params["Mode"]);
    }
    protected void btnItmpIternarySaveItm_Click(object sender, EventArgs e)
    {

    }
    protected void txtYearIns_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GvInspectionIternaryIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ItenaryId"] = GvInspectionIternaryIns.SelectedDataKey.Value.ToString();
        if (Request.Params["Mode"] != null)
        {
            switch (Request.Params["Mode"])
            {
                case "InspectionItenaryDe":
                    fldScheduleId.Value = ViewState["ScheculeId"].ToString();
                    MvInspectionIternary.SetActiveView(MvInspectionIternary.Views[0]);
                    FvInspectionIternary.ChangeMode(FormViewMode.Edit);
                    break;
                case "InspectionItenary":
                    fldScheduleId.Value = ViewState["ScheculeId"].ToString();
                    MvInspectionIternary.SetActiveView(MvInspectionIternary.Views[0]);
                    FvInspectionIternary.ChangeMode(FormViewMode.ReadOnly);
                    break;
            }
        }

    }
    protected void GvYearlyInspection_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Get the Yearly Schedule Id
        Guid ScheduleId = (Guid)GvYearlyInspection.SelectedDataKey.Value;
        fldScheduleId.Value = Convert.ToString(ScheduleId);
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
            GvInspectionDetails.DataSource = dtScheduleDetails;
            GvInspectionDetails.DataBind();
        }
        //DropDownList ddlInspectionMonth = ((DropDownList)FvInspectionIternary.FindControl("ddlMonth" + Mode));


    }
    protected void FvInspectionIternary_DataBound(object sender, EventArgs e)
    {
        string Mode = String.Empty;
        switch (FvInspectionIternary.CurrentMode)
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

        // Get the Yearly Schedule Id
        Guid ScheduleId = new Guid(fldScheduleId.Value);
        // Get the Monthly schedule details for the selected Schedule
        Inspection objInspection = new Inspection();
        DataTable dtScheduleDetails = objInspection.GetYearlyInspectionDetailsById(ScheduleId);
        DropDownList ddlInspectionMonth = ((DropDownList)FvInspectionIternary.FindControl("ddlMonth" + Mode));

        GvInspectionDetails.DataSource = dtScheduleDetails;
        GvInspectionDetails.DataBind();
        if (dtScheduleDetails.Rows.Count > 0)
        {
            //int year= (int)dtScheduleDetails.Rows[0]["Year"];
            //Label lblYear = (Label)FvInspectionIternary.FindControl("lblYear" + Mode);
            //if (lblYear != null)
            //    lblYear.Text = Convert.ToString(year);

            //PopCalendar popInspectingDate = (PopCalendar)FvInspectionIternary.FindControl("popInspectingDate" + Mode);

            //RangeFrom DateFrom = new RangeFrom();
            //RangeTo DateTo = new RangeTo();

            //DateFrom.Date = new DateTime(year, ddlInspectionMonth.SelectedIndex, 01);
            //DateTo.Date = new DateTime(year, ddlInspectionMonth.SelectedIndex, DateTime.DaysInMonth(year, ddlInspectionMonth.SelectedIndex));

            //if (popInspectingDate != null){
                //popInspectingDate.From = DateFrom;
                //popInspectingDate.To = DateTo;
            //}
            ddlInspectionMonth.SelectedIndex = Convert.ToInt32(dtScheduleDetails.Rows[0]["Month"]);
        }
    }

    protected void GvInspectionDetailsIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["ScheculeId"] = GvYearlyInspection.SelectedDataKey.Value.ToString();
        fldScheduleId.Value = ViewState["ScheculeId"].ToString();
        if (Request.Params["Mode"] != null)
        {
            switch (Request.Params["Mode"])
            {
                case "InspectionItenaryDe":
                    MvInspectionIternary.SetActiveView(MvInspectionIternary.Views[0]);
                    FvInspectionItenaryReadOnly.ChangeMode(FormViewMode.ReadOnly);
                    break;
                case "InspectionItenary":
                    MvInspectionIternary.SetActiveView(MvInspectionIternary.Views[0]);
                    FvInspectionIternary.ChangeMode(FormViewMode.ReadOnly);
                    break;
            }
        }
    }
    protected void FvInspectionIternary_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        GvInspectionIternaryIns.DataBind();
    }
}
