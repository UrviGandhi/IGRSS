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
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;

public partial class _Default : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //((IGRSS_Default)this.Master).ShowStatusMessage("Welcome", "", MessageType.Success);
    }
    protected void grdAlerts_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView gv = (GridView)sender;
        string alertId = "AlertId=" + gv.SelectedDataKey.Value.ToString();
        Response.Redirect(((string)ViewState["Url"]) + alertId);
    }
    protected void grdAlerts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ViewState["Url"] = e.CommandArgument + "&";

    }
    protected void grdAlerts_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        IgrssAlert curAlert = (IgrssAlert)e.Row.DataItem;
        if (curAlert != null)
        {
            e.Row.Enabled = curAlert.IsActive;
        }
    }
}
