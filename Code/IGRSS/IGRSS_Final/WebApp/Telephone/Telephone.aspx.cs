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
public partial class Telephone_Telephone : IgrssPage
{
	DataTable dt = new DataTable();
	Telephone objTelePhone = new Telephone();
	protected void Page_Load(object sender, EventArgs e)
	{
		switch (Request.Params["Mode"])
		{
			case "DataEntry":
				mvTelephone.SetActiveView(mvTelephone.Views[1]);
				FvTelephone.ChangeMode(FormViewMode.Insert);
				break;
			case "Verify":
				mvTelephone.SetActiveView(mvTelephone.Views[0]);
				break;
			case "ReadOnly":
				mvTelephone.SetActiveView(mvTelephone.Views[0]);
				break;
		}
		Session["Mode"] = Request.Params["Mode"];
	}
	protected void gdTelephoneDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		switch ((string) Session["Mode"])
		{
			case "Verify":
				mvTelephone.SetActiveView(mvTelephone.Views[1]);
				FvTelephone.ChangeMode(FormViewMode.Edit);
				break;
			case "ReadOnly":
				mvTelephone.SetActiveView(mvTelephone.Views[2]);
				fvReadonly.ChangeMode(FormViewMode.ReadOnly);
				break;
		}
		
	}
	protected void lnltest_Click(object sender, EventArgs e)
	{
		mvTelephone.SetActiveView(mvTelephone.Views[2]);
		FvTelephone.ChangeMode(FormViewMode.Insert);
	}
	protected void LinkButton1_Click(object sender, EventArgs e)
	{
		Session["click"] = true;
		mvTelephone.SetActiveView(mvTelephone.Views[1]);
		
	}
	protected void LinkButton3_Click(object sender, EventArgs e)
	{
		Session["click"] = false;
		mvTelephone.SetActiveView(mvTelephone.Views[1]);
		
	}
	protected void btnSearchCallDetails_Click(object sender, EventArgs e)
	{
		if (txtEmpName.Text =="" && txtEmpNo.Text != "")
		{
			dt=objTelePhone.GetTelePhoneDetailsByEmpNo(txtEmpNo.Text);
			gdTelephoneDetails.DataSource=dt;
			gdTelephoneDetails.DataBind();
		}
		else if (txtEmpNo.Text == "" && txtEmpName.Text != "")
		{
				dt= objTelePhone.GetTelePhoneDetailsByEmpName(txtEmpName.Text);
				gdTelephoneDetails.DataSource=dt;
				gdTelephoneDetails.DataBind();
		}
		else
		{
				dt= objTelePhone.GetAllTelePhoneDetails();
				gdTelephoneDetails.DataSource=dt;
				gdTelephoneDetails.DataBind();
		}
		Session["TelephoneDtl"] = dt;
		txtEmpNo.Text = "";
		txtEmpName.Text = "";
	}
	protected void txtCallDateItm_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvReadonly.FindControl("txtCallDateItm");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
		
	}
	protected void txtModifiedAt_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvReadonly.FindControl("txtModifiedAt");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtCreatedAt_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) fvReadonly.FindControl("txtCreatedAt");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
		
	}
	protected void fvReadonly_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	}
	protected void btnBackToGrid_Click(object sender, EventArgs e)
	{
		mvTelephone.SetActiveView(mvTelephone.Views[0]);

	}
	protected void txtCallDateUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvTelephone.FindControl("txtCallDateUpd");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void gdTelephoneDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{

		gdTelephoneDetails.DataSource = (DataTable) Session["TelephoneDtl"];
		gdTelephoneDetails.PageIndex = e.NewPageIndex;
		gdTelephoneDetails.DataBind();
	}
	protected void gdTelephoneDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
	{

	}
}
