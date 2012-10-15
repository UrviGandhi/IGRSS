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

public partial class License_FrankingMachine : IgrssPage
{
    LicenseApplication objLicense = new LicenseApplication();
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)

        {
            FileManagement_FileForward ff = (FileManagement_FileForward)fvVendorDetails.FindControl("FileForward1");
            if (Request.Params["AlertId"] != null)
            {
                IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
                fldLicenseId.Value = alert.SessionData["FileId"].ToString();
                ff.FileId = new Guid(fldLicenseId.Value);
            }

            switch (Request.Params["Mode"])
            {
                case "DataEntry":
                    mvLicApp.SetActiveView(mvLicApp.Views[1]);
                    fvVendorDetails.ChangeMode(FormViewMode.Insert);
                    //ff.SetPermissions(true, false, false);
                    break;
                case "Verify":
                    mvLicApp.SetActiveView(mvLicApp.Views[1]);
                    fvVendorDetails.ChangeMode(FormViewMode.Edit);
                    //ff.SetPermissions(true, false, true);
                    break;
                case "ReadOnly":
                    mvLicApp.SetActiveView(mvLicApp.Views[0]);
                    fvVendorDetails.ChangeMode(FormViewMode.ReadOnly);
                    //ff.SetPermissions(false, false, true);
                    break;
            }
        }

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        odsGetVendorDetails.DataBind();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        ////switch ((string) Session["Mode"])
        ////{
        ////    case "Verify":
        ////        mvLicApp.SetActiveView(mvLicApp.Views[1]);
        ////        fvVendorDetails.ChangeMode(FormViewMode.Edit);
        ////        break;
        //    case "ReadOnly":
        mvLicApp.SetActiveView(mvLicApp.Views[2]);
        fvReadOnly.ChangeMode(FormViewMode.ReadOnly);
        //break;
        //}
        
    }
    protected void fvVendorDetails_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        mvLicApp.SetActiveView(mvLicApp.Views[0]);
        fvVendorDetails.Controls.Clear();
    }

    protected void gvVendorDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        //switch ((string) Session["Mode"])
        //{
        //    case "Verify":
        //        mvLicApp.SetActiveView(mvLicApp.Views[1]);
        //        fvVendorDetails.ChangeMode(FormViewMode.Edit);
        //        break;
        //    case "ReadOnly":
        //        mvLicApp.SetActiveView(mvLicApp.Views[2]);
        //        fvReadOnly.ChangeMode(FormViewMode.ReadOnly);
        //        break;
        //}
        mvLicApp.SetActiveView(mvLicApp.Views[2]);
        fvReadOnly.ChangeMode(FormViewMode.ReadOnly);


    }

    protected void btnNewRegistration_Click(object sender, EventArgs e)
    {
        mvLicApp.SetActiveView(mvLicApp.Views[1]);
        fvVendorDetails.ChangeMode(FormViewMode.Insert);
    }

    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {
        //gvVendorDetail.DataSource = objLicense.GetvendordetailByAppNumber(txtApplicationNo.Text);
        //gvVendorDetail.DataBind();
        if (txtApplicationNo.Text == "" && txtVendorName.Text != "")
        {
            //Calling the method of the BLL and Binding result with GridView.

            dt = objLicense.GetVendordetailByVendorName(txtVendorName.Text);
            gvVendorDetail.DataSource = dt;
            gvVendorDetail.DataBind();
        }
        else if (txtVendorName.Text == "" && txtApplicationNo.Text != "")
        {
            //Calling the method of the BLL and Binding result with GridView.
            dt = objLicense.GetvendordetailByAppNumber(txtApplicationNo.Text);
            gvVendorDetail.DataSource = dt;
            gvVendorDetail.DataBind();
        }
        else
        {
            //Calling the method of the BLL and Binding result with GridView.
            dt = objLicense.GetData();
            gvVendorDetail.DataSource = dt;
            gvVendorDetail.DataBind();
        }
        Session["VendorDtl"] = dt;
        txtVendorName.Text = "";
        txtApplicationNo.Text = "";
    }
    protected void fvVendorDetails_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        mvLicApp.SetActiveView(mvLicApp.Views[0]);
        txtApplicationNo.Text = "";
        if (e.Exception == null)
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }

    protected void fvVendorDetails_ItemInserted1(object sender, FormViewInsertedEventArgs e)
    {
        mvLicApp.SetActiveView(mvLicApp.Views[0]);
        txtApplicationNo.Text = "";
        if (e.Exception == null)
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }

    protected void fvVendorDetails_ItemInserting(object sender, FormViewInsertEventArgs e)
    {

        Global.SetFormViewParameters(e.Values, LicenseApplication.GetRow());
        //Code Added By Akhilesh.
        FileManagement_FileForward ffc = (FileManagement_FileForward)fvVendorDetails.FindControl("FileForward1");
        Remarks rem = new Remarks();
        rem.Subject = ((TextBox)ffc.FindControl("txtRemarkSubject")).Text;
        rem.Body = ((TextBox)ffc.FindControl("txtRemarkBody")).Text;
        e.Values.Add("rem", rem);
        //e.Values.Add("SubmissionOfficeId", new Guid("90A44C94-4763-4CC2-9484-97A3C1608627"));

    }

    protected void fvVendorDetails_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Global.SetFormViewParameters(e.NewValues, LicenseApplication.GetRow());
        FileManagement_FileForward ffc = (FileManagement_FileForward)fvVendorDetails.FindControl("FileForward1");
        Remarks rem = new Remarks();
        rem.Subject = ((TextBox)ffc.FindControl("txtRemarkSubject")).Text;
        rem.Body = ((TextBox)ffc.FindControl("txtRemarkBody")).Text;
        e.NewValues.Add("rem", rem);
    }

    protected void odsGetVendorDetails_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        bool Verified = ((CheckBox)fvVendorDetails.FindControl("chkVerified")).Checked;
        e.InputParameters["Verified"] = Verified;
        e.InputParameters["AlertId"] = Request.Params["AlertId"];
        e.InputParameters.Remove("Values");
    }

    protected void Link_Click(object sender, EventArgs e)
    {
    }
    protected void fvVendorDetails_Load(object sender, EventArgs e)
    {
        string Mode = "";
        switch (((FormView)sender).CurrentMode)
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
        //DropDownList ddlOfficeName = (DropDownList) ((FormView) sender).FindControl("ddlOfficeName" + Mode);
        //Profile.Permissions.FillOffices(ddlOfficeName, "LIC", Request.Params["Mode"]);
    }
    protected void fvVendorDetails_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void LicInsert_Click(object sender, EventArgs e)
    {

    }
    protected void odsGetVendorDetails_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }


    protected void gvVendorDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVendorDetail.DataSource = (DataTable)Session["VendorDtl"];
        gvVendorDetail.PageIndex = e.NewPageIndex;
        gvVendorDetail.DataBind();
    }
    protected void FileForward1_Load(object sender, EventArgs e)
    {
    }
    protected void ddlOfficeNameIns_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "FRK", Request.Params["Mode"]);
    }
    protected void ddlOfficeNameUpd_Load(object sender, EventArgs e)
    {
        Profile.Permissions.FillOffices((DropDownList)sender, "FRK", Request.Params["Mode"]);
    }
    protected void odsFrankingMachineDetails_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void odsFrankingMachineDetails_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        bool Verified = ((CheckBox)fvVendorDetails.FindControl("chkVerified")).Checked;
        e.InputParameters["Verified"] = Verified;
        e.InputParameters["AlertId"] = Request.Params["AlertId"];
        e.InputParameters.Remove("Values");
    }
}
