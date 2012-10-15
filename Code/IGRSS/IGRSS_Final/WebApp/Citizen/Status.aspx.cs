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

public partial class Citizen_Status : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void btnSearch_Click(object sender, EventArgs e)
	{
		mvAppealStatus.SetActiveView(mvAppealStatus.Views[1]);
	}
}
