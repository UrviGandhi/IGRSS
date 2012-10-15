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
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using IGRSS.DataAccessLayer.ConfigTableAdapters;
public partial class Leave_Leave : IgrssPage
{
	Leave objLeave = new Leave();
	protected void Page_Load(object sender, EventArgs e)
	{
		switch (Request.Params["Mode"])
		{
			case "DataEntry":
				mvLeave.SetActiveView(mvLeave.Views[1]);
				fvLeave.ChangeMode(FormViewMode.Insert);
				break;
			case "Verify":
				mvLeave.SetActiveView(mvLeave.Views[0]);
			
				break;
			case "ReadOnly":
				mvLeave.SetActiveView(mvLeave.Views[0]);
			
				break;
		}
		Session["Mode"] = Request.Params["Mode"];
		if (fvLeave.CurrentMode == FormViewMode.Insert)
		{
			//Creating Instance Of the IgrssGlobalConfigTableAdapter
			IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
			//Calling Bll method and storing result into XmlDataSource
			XmlLeaveType.Data = (string) ConfigAdapter.GetConfigByModule("LEA", "LEATYPE");
			//Binding XmlDataSource
			XmlLeaveType.DataBind();
		}
		if (fvLeave.CurrentMode == FormViewMode.Edit)
		{
			//Creating Instance Of the IgrssGlobalConfigTableAdapter
			IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
			//Calling Bll method and storing result into XmlDataSource
			XmlLeaveType.Data = (string) ConfigAdapter.GetConfigByModule("REF", "CompType");
			//Binding XmlDataSource
			XmlLeaveType.DataBind();
		}
		if (fvreadonly.CurrentMode == FormViewMode.ReadOnly)
		{
			//Creating Instance Of the IgrssGlobalConfigTableAdapter
			IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
			//Calling Bll method and storing result into XmlDataSource
			XmlLeaveType.Data = (string) ConfigAdapter.GetConfigByModule("REF", "CompType");
			//Binding XmlDataSource
			XmlLeaveType.DataBind();
		}
	}
	protected void gvLeaveDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		switch ((string) Session["Mode"])
		{
			case "Verify":
				mvLeave.SetActiveView(mvLeave.Views[1]);
				fvLeave.ChangeMode(FormViewMode.Edit);
				break;
			case "ReadOnly":
				mvLeave.SetActiveView(mvLeave.Views[2]);
				fvreadonly.ChangeMode(FormViewMode.ReadOnly);
				break;
		}
			
	}
	protected void fvLeave_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
			Global.SetFormViewParameters(e.Values, Leave.GetRow());
	}
	protected void fvLeave_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
			Global.SetFormViewParameters(e.NewValues, Leave.GetRow());
		
	}
	protected void odsLeave_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
			FormViewParameter Parameters = new FormViewParameter();
			Parameters.Values = (DataRow) e.InputParameters["Values"];
			e.InputParameters["Parameter"] = Parameters;
			e.InputParameters.Remove("Values");
	}
	protected void lnltest_Click(object sender, EventArgs e)
	{
			//Activating different views of MultiView.
			mvLeave.SetActiveView(mvLeave.Views[2]);
			//Changing FormView Mode.
			fvLeave.ChangeMode(FormViewMode.Insert);
	}
	protected void LinkButton1_Click(object sender, EventArgs e)
	{
			//Activating different views of MultiView.
			mvLeave.SetActiveView(mvLeave.Views[1]);
		
	}
	protected void btnSearchEmpDetails_Click(object sender, EventArgs e)
	{
		if (txtEmpName.Text == "" && txtEmpNo.Text != "")
		{
			//Calling the method of the BLL and Binding result with GridView.
			gvLeaveDetails.DataSource = objLeave.GetLeavedetailsByEmployeeNo(txtEmpNo.Text);
			gvLeaveDetails.DataBind();
		}
		else if (txtEmpNo.Text == "" && txtEmpName.Text != "")
		{
			//Calling the method of the BLL and Binding result with GridView.
			gvLeaveDetails.DataSource = objLeave.GetLeavedetailsByEmployeeName(txtEmpName.Text);
			gvLeaveDetails.DataBind();
		}
		else
		{
			//Calling the method of the BLL and Binding result with GridView.
			gvLeaveDetails.DataSource = objLeave.GetLeavedetails();
			gvLeaveDetails.DataBind();
		}
		txtEmpNo.Text = "";
		txtEmpName.Text = "";
	
	}
	protected void txtApplicationDateUpd_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtLeaveFromUpd_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtLeaveToUpd_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtJoiningUpd_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtApplicationDateUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvLeave.FindControl("txtApplicationDateUpd");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtLeaveFromUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvLeave.FindControl("txtLeaveFromUpd");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
		
	}
	protected void txtJoiningUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvLeave.FindControl("txtJoiningUpd");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtLeaveToUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvLeave.FindControl("txtLeaveToUpd");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtApplicationDateItm_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvreadonly.FindControl("txtApplicationDateItm");
		if (txt.Text != "")
		{
		    DateTime s = Convert.ToDateTime(txt.Text);
		    txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtLeaveFromItm_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvreadonly.FindControl("txtLeaveFromItm");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtLeaveToItm_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvreadonly.FindControl("txtLeaveToItm");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtJoiningItm_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvreadonly.FindControl("txtJoiningItm");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtCreatedAt_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvreadonly.FindControl("txtCreatedAt");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtModifiedAt_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvreadonly.FindControl("txtModifiedAt");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtApplicationDateItm_TextChanged(object sender, EventArgs e)
	{

	}
}
