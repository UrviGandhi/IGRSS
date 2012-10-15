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

public partial class Reports_FileMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnShowReport_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> reportParams = new Dictionary<string, string>();
        reportParams.Add("FileDepartment", ddlModule.SelectedValue);
        Session["ReportParams"] = reportParams;
        Session["ReportName"] = "FileMaster";
        Response.Redirect("~/Report/Report.aspx");

    }
}
