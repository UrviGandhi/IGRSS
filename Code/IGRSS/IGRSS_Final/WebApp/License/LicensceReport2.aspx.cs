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

public partial class License_LicensceReport2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }   
    protected void btnReport_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> reportParams = new Dictionary<string, string>();
        reportParams.Add("LicenseApplicationId", txtLicenseNo.Text);
        reportParams.Add("Report_Parameter_Bmachine", txtBmachine.Text);
        reportParams.Add("Report_Parameter_Mmachine",txtMaximum.Text);
        reportParams.Add("Report_Parameter_Manmachine", txtMmachine.Text);
        reportParams.Add("Report_Parameter_Meters",txtMeters.Text);
        reportParams.Add("Report_Parameter_Frank", txtRange.Text);
        reportParams.Add("Report_Parameter_amount",txtMaximum.Text);
        reportParams.Add("Report_Parameter_Stamp", txtStamp.Text);
        Session["ReportParams"] = reportParams;
        if (ddlReport.Text == "Individual")
        {
            Session["ReportName"] = "Report2";
        }
        else 
        {
            Session["ReportName"] = "Report3";
        }
        Response.Redirect("~/Report/Report.aspx"); 

    }
}
