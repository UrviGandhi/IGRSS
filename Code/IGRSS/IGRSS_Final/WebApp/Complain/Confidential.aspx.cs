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
using System.Threading;
using IGRSS.BusinessObjects;
using Resources;

public partial class Complain_Confidential : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["AlertId"] != null)
        {
            IgrssAlert Alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
            fldComplainId.Value = Alert.SessionData["FileId"].ToString();
        }
        if (Request.Params["RedirID"] != null)
        {
            fldComplainId.Value = Request.Params["RedirID"].ToString();
            mvComplain.SetActiveView(mvComplain.Views[2]);
            fvReadonly.ChangeMode(FormViewMode.ReadOnly);

        }
        switch (Request.Params["Mode"])
        {
            case "DataEntry":
                mvComplain.SetActiveView(mvComplain.Views[1]);
                fvcomplain.ChangeMode(FormViewMode.Insert);
                break;
            case "Verify":
                mvComplain.SetActiveView(mvComplain.Views[0]);
                fvcomplain.ChangeMode(FormViewMode.Edit);
                break;

        }
        if (fvcomplain.CurrentMode == FormViewMode.Insert)
        {
            IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
            XmlComplainType.Data = (string)ConfigAdapter.GetConfigByModule("COM", "CompType");
            XmlComplainType.DataBind();
        }
        if (fvcomplain.CurrentMode == FormViewMode.Edit)
        {
            IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
            XmlComplainType.Data = (string)ConfigAdapter.GetConfigByModule("COM", "CompType");
            XmlComplainType.DataBind();
        }
    }

    protected void ddlComplaintTypeIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        FormView fv = ((FormView)mvComplain.FindControl("fvComplain"));
        DropDownList ddl = ((DropDownList)fv.FindControl("ddlComplaintTypeIns"));
        MultiView mvComplainType = ((MultiView)fv.FindControl("mvComplainDetails"));
        mvComplainType.SetActiveView(mvComplainType.Views[1]);
        
     
        /* switch (ddl.SelectedItem.Text)
        {
            case "Internal":
                mvComplainType.SetActiveView(mvComplainType.Views[1]);
                break;
            case "External":
                mvComplainType.SetActiveView(mvComplainType.Views[0]);
                break;
        }*/
    }

    protected void gdComplain_SelectedIndexChanged(object sender, EventArgs e)
    {

        mvComplain.SetActiveView(mvComplain.Views[1]);
        fvcomplain.ChangeMode(FormViewMode.Edit);
    }

    protected void ddlComplaintTypeUps_SelectedIndexChanged(object sender, EventArgs e)
    {
        FormView fv = ((FormView)mvComplain.FindControl("fvComplain"));
        DropDownList ddl = ((DropDownList)fv.FindControl("ddlComplaintTypeUps"));
        MultiView mvComplainType = ((MultiView)fv.FindControl("mvPropertyDetailsUps"));
        switch (ddl.SelectedItem.Text)
        {
            case "Internal":
                mvComplainType.SetActiveView(mvComplainType.Views[1]);
                break;
            case "External":
                mvComplainType.SetActiveView(mvComplainType.Views[0]);
                break;
        }
    }
    protected void txtComplaintDateUps_DataBinding(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)fvcomplain.FindControl("txtComplaintDateUps");
        if (txt.Text != "")
        {
            DateTime s = Convert.ToDateTime(txt.Text);
            txt.Text = s.ToString("dd/MM/yyyy");

        }
    }
    protected void ddlComplaintTypeUps_DataBinding(object sender, EventArgs e)
    {

    }
    protected void ddlComplaintTypeUps_DataBound(object sender, EventArgs e)
    {
        FormView fv = ((FormView)mvComplain.FindControl("fvComplain"));
        DropDownList ddl = ((DropDownList)fv.FindControl("ddlComplaintTypeUps"));
        MultiView mvComplainType = ((MultiView)fv.FindControl("mvPropertyDetailsUps"));
        switch (ddl.SelectedItem.Text)
        {
            case "Internal":
                mvComplainType.SetActiveView(mvComplainType.Views[1]);
                break;
            case "External":
                mvComplainType.SetActiveView(mvComplainType.Views[0]);
                break;
        }
    }
    protected void fvcomplain_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values.Add("ComplainingEmpID", (Guid)Membership.GetUser().ProviderUserKey);
        Global.SetFormViewParameters(e.Values, Complain.GetComplainRow());

    }
    protected void odsComplain_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");

    }
    protected void odsComplain_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");

    }
    protected void fvcomplain_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        e.NewValues.Add("ComplainingEmpID", (Guid)Membership.GetUser().ProviderUserKey);
        Global.SetFormViewParameters(e.NewValues, Complain.GetComplainRow());

    }
    protected void ddlOfficeIdIns_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "COM", Request.Params["Mode"]);
    }
    protected void ddlOfficeIdUps_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "COM", Request.Params["Mode"]);
    }
    protected void ddlComOfficeIdIns_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "COM", Request.Params["Mode"]);
    }
    protected void odsComplain_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
}