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

public partial class FileManagement_FileStatus : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> reportParams = new Dictionary<string, string>();
        reportParams.Add("OfficeId", ddlOffice.SelectedValue);
        reportParams.Add("FIleDept", txtRefundPrefixIns.Text);
        reportParams.Add("FileNo",txtRefundSlNoIns.Text);
        reportParams.Add("fileYear",txtRefundYearIns.Text);
        Session["ReportParams"] = reportParams;
        Session["ReportName"] = "FileStatusforUsers";
        Response.Redirect("~/Report/Report.aspx");

    } 
}
 