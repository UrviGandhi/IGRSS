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
public partial class Service_ServiceReport : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGenerateReport_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> reportParams = new Dictionary<string, string>();
        reportParams.Add("FromDate", txtFromdate.Text);
        reportParams.Add("ToDate", txtToDate.Text);
        Session["ReportParams"] = reportParams;
        Session["ReportName"] = "Servicedetails";
        Response.Redirect("~/Report/Report.aspx");
    }
}
