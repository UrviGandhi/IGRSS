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
public partial class Central_Administration_Console_Masters_PostalDeliveryTypeLKP : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
	}
    protected void btnNew_Click(object sender, EventArgs e)
    {
        MvPostalDeliveryTypeLkp.SetActiveView(MvPostalDeliveryTypeLkp.Views[1]);
        fvDepartmentMaster.ChangeMode(FormViewMode.Insert);
        ((IGRSS_Default)this.Master).HideStatusMessage();
      
            ((TextBox)fvDepartmentMaster.FindControl("txtNameIns")).Text = "";
            ((TextBox)fvDepartmentMaster.FindControl("txtDescriptionIns")).Text = "";
    }
    protected void GVPostalDeliveryTypeLkp_SelectedIndexChanged(object sender, EventArgs e)
    {
        MvPostalDeliveryTypeLkp.SetActiveView(MvPostalDeliveryTypeLkp.Views[1]);
        fvDepartmentMaster.ChangeMode(FormViewMode.Edit);
    }
    protected void odsPostalDelivery_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void odsPostalDelivery_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvPostalDeliveryTypeLkp.SetActiveView(MvPostalDeliveryTypeLkp.Views[0]);
        GVPostalDeliveryTypeLkp.DataBind();
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
    protected void fvDepartmentMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
       // Global.SetFormViewParameters(e.Values, InwardOutward.GetPostalDeliveryRow());
      
    }
    protected void fvDepartmentMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
       // Global.SetFormViewParameters(e.NewValues, InwardOutward.GetPostalDeliveryRow());
      
    }
    protected void odsPostalDelivery_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void odsPostalDelivery_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvPostalDeliveryTypeLkp.SetActiveView(MvPostalDeliveryTypeLkp.Views[0]);
        GVPostalDeliveryTypeLkp.DataBind();
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MvPostalDeliveryTypeLkp.SetActiveView(MvPostalDeliveryTypeLkp.Views[0]);
        GVPostalDeliveryTypeLkp.DataBind();
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        MvPostalDeliveryTypeLkp.SetActiveView(MvPostalDeliveryTypeLkp.Views[0]);
        GVPostalDeliveryTypeLkp.DataBind();
    }
}
