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
public partial class Refund_RefundTest : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		string s = null;
		foreach (ListItem li in ListBox1.Items)
			if (li.Selected)
				s = s + li.Text + ",";
		Session["as"] =s.Remove(s.Length-1);
		Response.Redirect("~/Report/Report.aspx");

		
	}
}