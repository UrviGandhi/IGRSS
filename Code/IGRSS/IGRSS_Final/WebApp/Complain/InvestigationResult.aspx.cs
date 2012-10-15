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
using IGRSS.BusinessObjects;
public partial class Complain_InvestigationResult : IgrssPage
{
	Complain objInvestigation = new Complain();
	protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Request.Params["AlertId"] != null)
            {
                IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
                ViewState["AlertId"] = alert.AlertId;
                fldComplainId.Value = alert.SessionData["FileId"].ToString();

                mvAssignOfficer.SetActiveView(mvAssignOfficer.Views[1]);
            }
        }
		if (FvInvestigationdetail.CurrentMode == FormViewMode.ReadOnly)
		{
			IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
			XmlComplainType.Data = (string) ConfigAdapter.GetConfigByModule("COM", "CompType");
			XmlComplainType.DataBind();
		}
	}

	protected void Button1_Click(object sender, EventArgs e)
	{
		if (btnSubmit.Text == "Submit")
		{
			Guid ComplainId = (Guid) FvInvestigationdetail.DataKey.Values[0];
			if (!chkIsFinal.Checked)
				objInvestigation.AddInvestigatonDetail(ComplainId, Convert.ToDateTime(txtInvestigationDate.Text), txtInvestigationDetails.Text);
			else
				objInvestigation.CompleteInvestigaton(ComplainId, Convert.ToDateTime(txtInvestigationDate.Text), txtInvestigationDetails.Text);
		}
		else
		{
			Guid ComplainId = (Guid) gdInvestigationDetail.SelectedDataKey.Values[0];
			objInvestigation.UpdateInvestigationdetails(ComplainId, Convert.ToDateTime(txtInvestigationDate.Text), txtInvestigationDetails.Text);
			btnSubmit.Text = "Submit";
		}
		txtInvestigationDate.Text = "";
		txtInvestigationDetails.Text = "";
		chkIsFinal.Checked = false;
        odsGetInvestigationdetail.DataBind();
		gdInvestigationDetail.DataBind();
	}
	protected void gdComplain_SelectedIndexChanged(object sender, EventArgs e)
	{
        fldComplainId.Value = Convert.ToString(((GridView)sender).SelectedDataKey.Values["ComplainId"]);

		mvAssignOfficer.SetActiveView(mvAssignOfficer.Views[1]);
		FvInvestigationdetail.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void gdInvestigationDetail_SelectedIndexChanged(object sender, EventArgs e)
	{
		int i=gdInvestigationDetail.SelectedIndex;
		txtInvestigationDate.Text = ((Label) gdInvestigationDetail.Rows[i].FindControl("LblInvDate")).Text;
		txtInvestigationDetails.Text = ((Label) gdInvestigationDetail.Rows[i].FindControl("LblInvDetails")).Text;
		btnSubmit.Text = "Update";
	}

	protected void gdInvestigationDetail_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		
		Guid InvestigationId = (Guid) gdInvestigationDetail.DataKeys[0].Value;
		objInvestigation.DeleteInvesTigationDetails(InvestigationId);
		gdInvestigationDetail.DataBind();
	}


	protected void txtComplaintDateUps_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvInvestigationdetail.FindControl("txtComplaintDateUps");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void ddlComplaintTypeUps_DataBound(object sender, EventArgs e)
	{
		FormView fv = ((FormView) mvAssignOfficer.FindControl("FvInvestigationdetail"));
		DropDownList ddl = ((DropDownList) fv.FindControl("ddlComplaintTypeUps"));
		MultiView mvComplainType = ((MultiView) fv.FindControl("mvComplainDetails"));
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
}
