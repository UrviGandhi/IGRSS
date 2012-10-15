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

public partial class Employee_EmployeeReport : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	 protected void btnGenerateReport_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> reportParams = new Dictionary<string, string>();
        reportParams.Add("OfficeName",ddlOfficeName.SelectedItem.Text);
        Session["ReportParams"] = reportParams;
        Session["ReportName"] = "EmployeeMaster";
        Response.Redirect("~/Report/Report.aspx");
    }
}
