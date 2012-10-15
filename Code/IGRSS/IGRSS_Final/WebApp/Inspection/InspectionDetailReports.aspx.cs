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
using System.Collections.Generic;

public partial class Inspection_InspectionDetailReports : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void btnGet_Click(object sender, EventArgs e)
	{
		Dictionary<string, string> reportParams = new Dictionary<string, string>();

		reportParams.Add("InspectedOfficeId", ddlOfficeName.SelectedValue);

		Session["ReportName"] = "INspectionReport";

		Session["ReportParams"] = reportParams;

		Server.Transfer("../Report/Report.aspx");

	}
	protected void GvInspectionDemo_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvinspectionDetailsReport.SetActiveView(MvinspectionDetailsReport.Views[1]);
	
		
		
	}
}

