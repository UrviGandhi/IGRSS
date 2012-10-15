using System;
using System.Collections.Generic;
using System.Text;

namespace IGRSS.Workflows.Activites.Feedback
{
	public class FeedbackData
	{
		private string m_Role;
		public string Role
		{
			get
			{
				return m_Role;
			}
			set
			{
				m_Role = value;
			}
		}

		private Guid m_OrginatingOffice;
		public Guid OrginatingOffice
		{
			get
			{
				return m_OrginatingOffice;
			}
			set
			{
				m_OrginatingOffice = value;
			}
		}

		private Guid m_ForwardingOffice;
		public Guid ForwardingOffice
		{
			get
			{
				return m_ForwardingOffice;
			}
			set
			{
				m_ForwardingOffice = value;
			}
		}
		
		private bool m_Feedback;
		public bool Feedback
		{
			get
			{
				return m_Feedback;
			}
			set
			{
				m_Feedback = value;
			}
		}

		public FeedbackData(Guid OrginatingOffice, Guid ForwardingOffice, string role)
		{
			this.OrginatingOffice = OrginatingOffice;
			this.ForwardingOffice = ForwardingOffice;
			this.Role = role;
		}
	}
}
