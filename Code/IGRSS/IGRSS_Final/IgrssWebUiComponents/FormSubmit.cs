using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IgrssWebUiComponents
{
	[ToolboxData("<{0}:FormSubmit runat=server></{0}:FormSubmit>")]
	public class FormSubmit : WebControl
	{

		private List<FormControlItem> m_Commands;
		public List<FormControlItem> Commands
		{
			get
			{
				return m_Commands;
			}
			set
			{
				m_Commands = value;
			}
		}
	 

		protected override void CreateChildControls()
		{
			Button btn;
			foreach (FormControlItem item in Commands)
			{
				btn = new Button();
				btn.ID = "btn" + item.CommandName;
				btn.Text = item.CommandText;
				btn.CommandName = item.CommandName;
				this.Controls.Add(btn);
			}
			base.CreateChildControls();
			
		}

		public void OnInit(EventArgs e)
		{
			EnsureChildControls();
			base.OnInit(e);
		}
	}
}
