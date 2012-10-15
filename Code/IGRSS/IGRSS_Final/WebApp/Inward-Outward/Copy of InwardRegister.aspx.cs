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
                    FvInward.ChangeMode(FormViewMode.Insert);
                    break;
                case "Verify":
                    mvInward.SetActiveView(mvInward.Views[0]);
                    break;
                case "ReadOnly":
                    Response.Redirect("~/Inward-Outward/InwardOutwardReport.aspx");
                    break;
            }
        }


        //if (FvInward.CurrentMode == FormViewMode.Insert)
        //{
            //Creating Instance Of the IgrssGlobalConfigTableAdapter
            //IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
            ////Calling Bll method and storing result into XmlDataSource
            //XmlInwarddoctype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWDOCTYPE");
            ////Binding XmlDataSource
            //XmlInwarddoctype.DataBind();
            //Calling Bll method and storing result into XmlDataSource
            //XmlInwardtype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWTYPE");
            //Binding XmlDataSource
        //XmlInwardtype.DataBind();
        //}
        if (FvInward.CurrentMode == FormViewMode.Edit)
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
    protected void FvInward_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //Srtting the FormView Parameter.
        //Global.SetFormViewParameters(e.Values, InwardOutward.GetRow());
    }
    protected void FvInward_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Global.SetFormViewParameters(e.NewValues, InwardOutward.GetRow());
    }
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
        FvInward.ChangeMode(FormViewMode.Edit);
    }
    protected void FvInward_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

    }
    protected void FvInward_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        gvInwarddtl.DataBind();
        gvInwarddtl.SelectedIndex = -1;
        mvInward.SetActiveView(mvInward.Views[0]);
       
        
    }

    protected void txtInOutDateUpd_DataBinding(object sender, EventArgs e)
    {

    }


    //protected void ObjectDataSource1_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    //{

    //    FormViewParameter Parameters = new FormViewParameter();
    //    Parameters.Values = (DataRow)e.InputParameters["Values"];
    //    e.InputParameters["Parameter"] = Parameters;
    //    e.InputParameters.Remove("Values");

    //}

    protected void objectDataSource1_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        //FormViewParameter Parameters = new FormViewParameter();
        //Parameters.Values = (DataRow)e.InputParameters["Values"];
        //e.InputParameters["Parameter"] = Parameters;
        //e.InputParameters.Remove("Values");
    
    }
    protected void odsInward_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void FvInward_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {


    }
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
    protected void FvInward_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void NewButton_Click(object sender, EventArgs e)
    {
        //vieFv.Visible = true;
        //vieGrid.Visible =false;
    }

    protected void FvInward_PageIndexChanging1(object sender, FormViewPageEventArgs e)
    {

    }
    protected void btnUp_Click(object sender, EventArgs e)
    {

    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvInward.SetActiveView(mvInward.Views[1]);
        FvInward.ChangeMode(FormViewMode.Insert);
    }
}

