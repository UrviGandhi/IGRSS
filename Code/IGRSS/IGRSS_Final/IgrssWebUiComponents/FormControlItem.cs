using System;
using System.Collections.Generic;
using System.Text;

namespace IgrssWebUiComponents
{
	public class FormControlItem
	{
		private string m_CommandName;

		public string CommandName
		{
			get
			{
				return m_CommandName;
			}
			set
			{
				m_CommandName = value;
			}
		}

		private string m_CommandText;

		public string CommandText
		{
			get
			{
				return m_CommandText;
			}
			set
			{
				m_CommandText = value;
			}
		}

	}
}
