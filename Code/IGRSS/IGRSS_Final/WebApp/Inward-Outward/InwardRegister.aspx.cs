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
using IGRSS.DataAccessLayer.ConfigTableAdapters;
using Resources;
using System.Data;
using IGRSS.DataAccessLayer.DocumentUploadTableAdapters;
public partial class Inward_Outward_InwardRegister : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //vieGrid.Visible = true;
        //vieFv.Visible = false;
        if (!IsPostBack)
        {
            switch (Request.Params["Mode"])
            {
                case "DataEntry":
                    mvInward.SetActiveView(mvInward.Views[1]);
                    FormView_Inward.ChangeMode(FormViewMode.Insert);
                    break;
                case "Verify":
                    mvInward.SetActiveView(mvInward.Views[0]);
                    break;
                case "ReadOnly":
                    Response.Redirect("~/Inward-Outward/InwardOutwardReport.aspx");
                    break;
            }

            

        }


        if (FormView_Inward.CurrentMode == FormViewMode.Insert)
        {
            //Creating Instance Of the IgrssGlobalConfigTableAdapter
            IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
            //Calling Bll method and storing result into XmlDataSource
            XmlInwarddoctype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWDOCTYPE");
            //Binding XmlDataSource
            XmlInwarddoctype.DataBind();
            //Calling Bll method and storing result into XmlDataSource
            //XmlInwardtype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWTYPE");
            //Binding XmlDataSource
        //XmlInwardtype.DataBind();
        }
        if (FormView_Inward.CurrentMode == FormViewMode.Edit)
        {
            //Creating Instance Of the IgrssGlobalConfigTableAdapter
            IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
            //Calling Bll method and storing result into XmlDataSource
            XmlInwarddoctype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWDOCTYPE");
            //Binding XmlDataSource
            XmlInwarddoctype.DataBind();
            //Calling Bll method and storing result into XmlDataSource
            XmlInwardtype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWTYPE");
            //Binding XmlDataSource
            XmlInwardtype.DataBind();
        }
    }
    //protected void FvInward_ItemInserting(object sender, FormViewInsertEventArgs e)
    //{
    //    //Srtting the FormView Parameter.
    //    //Global.SetFormViewParameters(e.Values, InwardOutward.GetRow());
    //    Global.SetFormViewParameters(e.Values, new IGRSS.DataAccessLayer.Inward.InwardRegisterDataTable().NewRow());
    //}
    //protected void FvInward_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    //{
    //    Global.SetFormViewParameters(e.NewValues, InwardOutward.GetRow());
    //}
    protected void odsInward_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void gvInwarddtl_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Setting the MultiView
        mvInward.SetActiveView(mvInward.Views[1]);
        //Changing the Mode of the FormView.
        FormView_Inward.ChangeMode(FormViewMode.Edit);
        //DetailsView1.ChangeMode(DetailsViewMode.Edit);
    }
    //protected void FvInward_ItemCommand(object sender, FormViewCommandEventArgs e)
    //{

    //}
    //protected void FvInward_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    //{
    //    gvInwarddtl.DataBind();
    //    gvInwarddtl.SelectedIndex = -1;
    //    mvInward.SetActiveView(mvInward.Views[0]);
       
        
    //}

    protected void txtInOutDateUpd_DataBinding(object sender, EventArgs e)
    {

    }


    protected void odsInward_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    //protected void FvInward_ItemInserted(object sender, FormViewInsertedEventArgs e)
    //{
       
        
    //}
    protected void btnCancelIns_Click(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
    }
    protected void odsInward_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
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
    protected void odsInward_Updated(object sender, ObjectDataSourceStatusEventArgs e)
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
    //protected void FvInward_PageIndexChanging(object sender, FormViewPageEventArgs e)
    //{

    //}
    protected void NewButton_Click(object sender, EventArgs e)
    {
        //vieFv.Visible = true;
        //vieGrid.Visible =false;
    }

    //protected void FvInward_PageIndexChanging1(object sender, FormViewPageEventArgs e)
    //{

    //}
    //protected void btnUp_Click(object sender, EventArgs e)
    //{



    //}
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {
        odsgv.Select();
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        mvInward.SetActiveView(mvInward.Views[1]);
        
        FormView_Inward.ChangeMode(FormViewMode.Insert);

        // serial number should come instead of 1

        //((TextBox)FvInward.FindControl("txtInwardNo")).Text="IGR/1/2012";
    }

    protected void FormView_Inward_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (Page.IsValid)
        {
            if (e.AffectedRows > 0)
            {
                mvInward.SetActiveView(vieGrid);
            }
        }
    }
    protected void FormView_Inward_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Back":
                    mvInward.SetActiveView(vieGrid);
                break;
            case "UploadFile":
                FileUpload FileUploadDocument = FormView_Inward.FindControl("FileUploadDocument") as FileUpload;
                string uploadedPath = UploadFile(FileUploadDocument);
                if (string.IsNullOrEmpty(uploadedPath) == false)
                {
                    // write the code to insert a new entry to Document_Upload
                    Document_UploadTableAdapter documentUploader = new Document_UploadTableAdapter();
                    documentUploader.UploadNewDocument("", "", "");
                }
                break;
        }
    }

    private string UploadFile(FileUpload fileUploadControl)
    {
        if (fileUploadControl != null)
        {
            if ((fileUploadControl.PostedFile != null) && (fileUploadControl.PostedFile.ContentLength > 0))
            {
                    string fileName = System.IO.Path.GetFileName(fileUploadControl.PostedFile.FileName);
                    string SaveLocation = Server.MapPath("Uploaded Documents\\Inward\\") + fileName;
                    fileUploadControl.PostedFile.SaveAs(SaveLocation);
                    return SaveLocation;
            }
        }
        return string.Empty;
    }

    protected void FormView_Inward_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList dropDownOffice = FormView_Inward.FindControl("dropdownlistSentTo") as DropDownList;
        e.Values["SentTo"] = dropDownOffice.SelectedValue;
        //e.Values["InwardNo"] +=(@"\"+dropDownOffice.SelectedValue);
    }
    protected void gvInwarddtl_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton linkbuttonEdit = e.Row.FindControl("linkbuttonEdit") as LinkButton;
            if (linkbuttonEdit != null)
            {
                linkbuttonEdit.CommandArgument = Convert.ToString(e.Row.RowIndex);
            }
        }
    }
    protected void gvInwarddtl_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Modify":
                mvInward.SetActiveView(vieFv);
                FormView_Inward.ChangeMode(FormViewMode.Edit);
                FormView_Inward.PageIndex = Convert.ToInt32(e.CommandArgument);
                break;
        }
    }
    protected void odsgv_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
            e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
            odsgv.SelectMethod = "GetDataBy";

    }
   
}

