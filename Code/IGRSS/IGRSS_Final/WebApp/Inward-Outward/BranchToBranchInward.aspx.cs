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
public partial class Inward_Outward_BranchToBranchInward : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            switch (Request.Params["Mode"])
            {
                case "DataEntry":
                    mvBTBInward.SetActiveView(mvBTBInward.Views[1]);
                    fvBTBInward.ChangeMode(FormViewMode.Insert);
                    break;
                case "Verify":
                    mvBTBInward.SetActiveView(mvBTBInward.Views[0]);
                    break;

            }
        }
        if (fvBTBInward.CurrentMode == FormViewMode.Insert)
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
        if (fvBTBInward.CurrentMode == FormViewMode.Edit)
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
    protected void fvBTBInward_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //Srtting the FormView Parameter.
        Global.SetFormViewParameters(e.Values, InwardOutward.GetRow());
    }
    protected void gvInwardDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvBTBInward.SetActiveView(mvBTBInward.Views[1]);
        fvBTBInward.ChangeMode(FormViewMode.Edit);
    }
    protected void odsBranch_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
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
        mvBTBInward.SetActiveView(mvBTBInward.Views[0]);
        gvInwardDetails.DataBind();
    }
    protected void odsBranch_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvBTBInward.SetActiveView(mvBTBInward.Views[0]);
        gvInwardDetails.DataBind();
    }
    protected void odsBranch_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void fvBTBInward_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Global.SetFormViewParameters(e.NewValues, InwardOutward.GetRow());
    }
    protected void odsBranch_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvBTBInward.SetActiveView(mvBTBInward.Views[1]);
        fvBTBInward.ChangeMode(FormViewMode.Insert);
    }
}
