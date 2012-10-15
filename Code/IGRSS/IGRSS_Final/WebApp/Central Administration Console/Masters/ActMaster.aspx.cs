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
using System.Collections.Generic;
using Resources;
public partial class Refund_ActMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
    }
	
	protected void Button1_Click(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
         mvActMaster.SetActiveView(mvActMaster.Views[1]);
         FormView1.ChangeMode(FormViewMode.Insert);
     //    ((TextBox)FormView1.FindControl("txtNameIns")).Text = "";
     //    ((TextBox)FormView1.FindControl("txtDescriptionIns")).Text = "";
     //    ((IGRSS_Default)this.Master).HideStatusMessage();
     ////    MvDepartmentMaster.SetActiveView(MvDepartmentMaster.Views[1]);
     //    fvDepartmentMaster.ChangeMode(FormViewMode.Insert);
     //    ((TextBox)fvDepartmentMaster.FindControl("txtDescriptionIns")).Text = "";
     //    ((TextBox)fvDepartmentMaster.FindControl("txtNameIns")).Text = "";
     }
	protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
	{
		odsSelectedActDetails.ID = GridView1.SelectedDataKey.Value.ToString();
        mvActMaster.SetActiveView(mvActMaster.Views[1]);
		FormView1.ChangeMode(FormViewMode.Edit);
	

	}
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {
        ((TextBox)FormView1.FindControl("txtname")).Text = "";
        ((TextBox)FormView1.FindControl("txtDescription")).Text = "";
       
    }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void odsSelectedActDetails_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvActMaster.SetActiveView(mvActMaster.Views[0]);
        GridView1.DataBind();
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue,true))
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed,"Record already Exists!", MessageType.Error);
           
        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
        
    }
    protected void odsSelectedActDetails_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvActMaster.SetActiveView(mvActMaster.Views[0]);
        GridView1.DataBind();
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
    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
       
       
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        mvActMaster.SetActiveView(mvActMaster.Views[0]);
        GridView1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        mvActMaster.SetActiveView(mvActMaster.Views[0]);
        GridView1.DataBind();
    }
}
