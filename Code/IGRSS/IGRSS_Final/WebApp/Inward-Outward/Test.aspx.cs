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
using System.Drawing;
public partial class Inward_Outward_Test : IgrssPage
{
	

	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void Button2_Click(object sender, EventArgs e)
	{
		DataTable dt = new DataTable();
		DataRow dr;
		dt.Columns.Add("Name",typeof(string));
		dt.Columns.Add("Amount",typeof(decimal));
		
		foreach (ListItem L1 in ListBox2.Items)
		{
			if (L1.Selected)
			{
				dr = dt.NewRow();
				dr["Name"] = L1.Text;
				dr["Amount"] = TextBox2.Text;
				dt.Rows.Add(dr);
			}
		}
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}
}
