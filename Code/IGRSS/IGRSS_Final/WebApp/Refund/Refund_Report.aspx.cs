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

public partial class Refund_Refund_Report : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
	{
		switch (RadioButtonList1.SelectedItem.Text)
		{
			case "Distic":
				ListBox1.DataSource = odsDistic;
				ListBox1.DataTextField = "distname";
				ListBox1.DataValueField = "distcd";
				ListBox1.DataBind();
				break;
		    case "Taluka":
				ListBox1.DataSource = odsTaluka;
				ListBox1.DataTextField = "talukaname";
				ListBox1.DataValueField = "talcd";
				ListBox1.DataBind();
				break;
			case "Village":
				ListBox1.DataSource = odsVillage;
				ListBox1.DataTextField = "villname";
				ListBox1.DataValueField = "villcd";
				ListBox1.DataBind();
				break;
		}
	}
	protected void RadioButtonList1_TextChanged(object sender, EventArgs e)
	{

	}
	protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
	{

	}
}
