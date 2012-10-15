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

public partial class FormCommands : System.Web.UI.UserControl
{
	private string m_FormName;
	public string FormName
	{
		get
		{
			return m_FormName;
		}
		set
		{
			m_FormName = value;
		}
	}

	private string m_ContentPlaceHolder;
	public string ContentPlaceHolder
	{
		get
		{
			return m_ContentPlaceHolder;
		}
		set
		{
			m_ContentPlaceHolder = value;
		}
	}

/*
	private bool m_AllowInsert;
	public bool AllowInsert
	{
		get
		{
			return m_AllowInsert;
		}
		set
		{
			m_AllowInsert = value;
		}
	}

	private bool m_AllowDelete;
	public bool AllowDelete
	{
		get
		{
			return m_AllowDelete;
		}
		set
		{
			m_AllowDelete = value;
		}
	}
	private bool m_AllowUpdate;
	public bool AllowUpdate
	{
		get
		{
			return m_AllowUpdate;
		}
		set
		{
			m_AllowUpdate = value;
		}
	}
	private bool m_AllowCancel;
	public bool AllowCancel
	{
		get
		{
			return m_AllowCancel;
		}
		set
		{
			m_AllowCancel = value;
		}
	}
	*/

	private string m_Mode;
	public string Mode
	{
		get
		{
			return m_Mode;
		}
		set
		{
			m_Mode = value;
		}
	}



	protected void Page_Load(object sender, EventArgs e)
	{
		btnUpdate.Visible = false;
		btnCancel.Visible = false;
		btnInsert.Visible = false;
		btnDelete.Visible = false;

		FormName = ((HiddenField) Page.Master.FindControl("fvName")).Value;
		FormView fv = (FormView) Page.Master.FindControl("Main").FindControl(FormName);
		if (FormName != "")
		{
			switch ((fv.CurrentMode))
			{
				case FormViewMode.Edit:
					btnUpdate.Visible = true;
					btnCancel.Visible = true;
					Mode = "Edit";
					break;
				case FormViewMode.Insert:
					btnInsert.Visible = true;
					btnCancel.Visible = true;
					Mode = "Insert";
					break;
				case FormViewMode.ReadOnly:
					btnDelete.Visible = true;
					Mode = "ReadOnly";
					break;
				default:
					break;
			}
		}

		if (ContentPlaceHolder == null)
		{
			ContentPlaceHolder = "Main";
		}
		//btnCancel.Visible = AllowCancel;
	}
	protected void Button_Click(object sender, EventArgs e)
	{
		//string id = (string) Session["Name"];
		FormView fv = (FormView) Page.Master.FindControl(ContentPlaceHolder).FindControl(FormName);
		switch (Mode)
		{
			case "Edit":
				fv.UpdateItem(true);
				break;
			case "Insert":
				fv.InsertItem(true);
				break;
			case "ReadOnly":
				fv.DeleteItem();
				break;
			default:
				break;
		}
	}
	protected void btnCancel_Click(object sender, EventArgs e)
	{
	}
}
