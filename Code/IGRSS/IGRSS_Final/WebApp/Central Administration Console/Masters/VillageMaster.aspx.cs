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

public partial class Central_Administration_Console_Masters_VillageMaster : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
    }
    protected void btnAddNewVillage_Click(object sender, EventArgs e)
    {
        fvVillageMaster.ChangeMode(FormViewMode.Insert);
    }
    protected void Btncancel_Click(object sender, EventArgs e)
    {
        fvVillageMaster.ChangeMode(FormViewMode.ReadOnly);
    }
}
