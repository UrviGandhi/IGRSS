using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace IGRSS.BusinessObjects
{
	public class FormViewParameter
	{
		private DataRow m_Values;
		public DataRow Values
		{
			get
			{
				return m_Values;
			}
			set
			{
				m_Values = value;
			}
		}

		public FormViewParameter()
		{

		}
	}
}
