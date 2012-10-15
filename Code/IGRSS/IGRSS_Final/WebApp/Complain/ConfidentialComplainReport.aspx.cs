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
public partial class Complain_ConfidentialComplainReport : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlOfficeName_Load(object sender, EventArgs e)
    {
        //Profile.Permissions.FillOffices((DropDownList)sender, "IOR", Request.Params["Mode"]);
    }
    protected void btnGenerateReport_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> reportParams = new Dictionary<string, string>();
        reportParams.Add("OfficeName", ddlOfficeName.SelectedItem.Text);
        Session["ReportParams"] = reportParams;
        Session["ReportName"] = "InwardOutward";
        Response.Redirect("~/Report/Report.aspx");
    }
    protected void btnGenerateReport_Click1(object sender, EventArgs e)
    {
       
        gvConfidentialComReport.DataBind();
    }
}
