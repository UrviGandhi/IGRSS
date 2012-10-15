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
using System.Collections.Generic;
public partial class Complain_AssignInvestigationOfficer : IgrssPage
{
    Complain objComplain = new Complain();
	protected void Page_Load(object sender, EventArgs e)
	{
		//Getting the current Mode of the formView.
		if (FvAssignOfficer.CurrentMode == FormViewMode.ReadOnly)
		{
			//Creating the Instance of the IgrssGlobalConfigTableAdapter Object
			IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
			//Calling the BLL method and Storing result into XmlDataSource
			XmlComplainType.Data = (string) ConfigAdapter.GetConfigByModule("COM", "CompType");
			//Binding the XmlDataSource
			XmlComplainType.DataBind();
		}
        if (Request.Params["AlertId"] != null)
        {
            IgrssAlert Alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
            fldComplainId.Value = Alert.SessionData["FileId"].ToString();
        }

	}
	protected void gdComplain_SelectedIndexChanged(object sender, EventArgs e)
	{
		mvAssignOfficer.SetActiveView(mvAssignOfficer.Views[1]);
        fldComplainId.Value = gdComplain.SelectedDataKey.Value.ToString();
		FvAssignOfficer.ChangeMode(FormViewMode.ReadOnly);

	}
	protected void FvAssignOfficer_ItemCommand(object sender, FormViewCommandEventArgs e)
	{
        if (e.CommandName == "AssignOfficer")
        {
            Complain cmp = new Complain();
            DropDownList ddlOffice = (DropDownList)FvAssignOfficer.FindControl("ddlOfficeName");
            DropDownList ddlDesig = (DropDownList)FvAssignOfficer.FindControl("ddlDesigination");
            string[] officer = WorkflowSupport.GetUserAtOfficeRole(new Guid(ddlOffice.SelectedValue), new Guid(ddlDesig.SelectedValue));
            cmp.AssignEnquiryOfficer(officer[0], new Guid(fldComplainId.Value));
            Response.Redirect("~/");
        }
	}
	protected void txtComplaintDateUps_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvAssignOfficer.FindControl("txtComplaintDateUps");
		if (txt.Text != "")
		{
            //
            
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}

    protected void ddlComplaintTypeUps_DataBound(object sender, EventArgs e)
	{
		FormView fv = ((FormView) mvAssignOfficer.FindControl("FvAssignOfficer"));
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
    protected void ffcAssignOfficer_Load(object sender, EventArgs e)
    {
        ((FileManagement_FileForward)sender).FileId = new Guid(fldComplainId.Value);
    }
    protected void btnSearchComplainNo_Click(object sender, EventArgs e)
    {

    }
    protected void FvAssignOfficer_Load(object sender, EventArgs e)
    {
        Button btnAssignOfficer = ((Button)FvAssignOfficer.FindControl("btnAssignOfficer"));
        CheckBox chkAssignEnquiry = ((CheckBox)FvAssignOfficer.FindControl("chkAssignEnquiry"));
        if (chkAssignEnquiry != null)
        {
            chkAssignEnquiry.Attributes.Add("onClick", "showEnquiryDetails('" + chkAssignEnquiry.ClientID + "', '" + btnAssignOfficer.ClientID + "')");
        }
    }
}
