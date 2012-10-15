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
using IGRSS.BusinessObjects;
using IGRSS.BusinessLogicLayer;
using System.Collections.Generic;
using Resources;
public partial class Service_Service : IgrssPage
{
	DataTable Dt;
	Service objSerVice = new Service();
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{

			switch (Request.Params["Mode"])
			{
				case "DataEntry":
					mvService.SetActiveView(mvService.Views[1]);
					fvService.ChangeMode(FormViewMode.Insert);
					break;
				case "Verify":
					mvService.SetActiveView(mvService.Views[0]);
					break;
				case "ReadOnly":
                    Response.Redirect("~/Service/ServiceReport.aspx");
					break;
			}
		}

		Session["Mode"] = Request.Params["Mode"];
	}
	protected void gvServiceNo_SelectedIndexChanged(object sender, EventArgs e)
	{
		switch ((string) Session["Mode"])
		{
			case "Verify":
				mvService.SetActiveView(mvService.Views[1]);
				fvService.ChangeMode(FormViewMode.Edit);
				break;
			case "ReadOnly":
				mvService.SetActiveView(mvService.Views[2]);
				FvReadOnly.ChangeMode(FormViewMode.ReadOnly);
				break;
		}
	}
	protected void odsService_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	protected void odsService_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
	}
	protected void fvService_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, Service.GetRow());
	}
	protected void fvService_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, Service.GetRow());
	}
	protected void lnltest_Click(object sender, EventArgs e)
	{
		mvService.SetActiveView(mvService.Views[2]);
		fvService.ChangeMode(FormViewMode.Insert);
	}
	protected void LinkButton1_Click(object sender, EventArgs e)
	{
		mvService.SetActiveView(mvService.Views[1]);
		
	}
	protected void btnSearchServiceNo_Click(object sender, EventArgs e)
	{
		
	}
	protected void txtServiceDateUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvService.FindControl("txtServiceDateUpd");
		if (txt.Text != "")
		txt.Text = txt.Text.Remove(10);
	}
	protected void txtServiceDateItm_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvReadOnly.FindControl("txtServiceDateItm");
		if (txt.Text != "")
			txt.Text = txt.Text.Remove(10);

	}
	protected void txtCreatedAt_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvReadOnly.FindControl("txtCreatedAt");
		if (txt.Text != "")
		txt.Text = txt.Text.Remove(10);
	}
	protected void txtModifiedAt_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvReadOnly.FindControl("txtModifiedAt");
		if (txt.Text != "")
		txt.Text = txt.Text.Remove(10);
	}
	protected void gvServiceNo_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvServiceNo.DataSource = (DataTable) Session["ServiceDtl"];
		gvServiceNo.PageIndex = e.NewPageIndex;
		gvServiceNo.DataBind();
	}
	protected void FvReadOnly_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	}
	protected void btnBackToGrid_Click(object sender, EventArgs e)
	{

		mvService.SetActiveView(mvService.Views[0]);
		
	}
    protected void odsService_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        //mvService.SetActiveView(mvService.Views[0]);
       
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
    protected void odsService_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        mvService.SetActiveView(mvService.Views[0]);
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
