using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace IGRSS.BusinessObjects
{
	public class IgrssAlert
	{

		private Guid m_AlertId;
		public Guid AlertId
		{
			get
			{
				return m_AlertId;
			}
			set
			{
				m_AlertId = value;
			}
		}

		private string m_Message;
		public string Message
		{
			get
			{
				return m_Message;
			}
			set
			{
				m_Message = value;
			}
		}

		private DateTime m_SentAt;
		public DateTime SentAt
		{
			get
			{
				return m_SentAt;
			}
			set
			{
				m_SentAt = value;
			}
		}

		private string m_SentTo;
		public string SentTo
		{
			get
			{
				return m_SentTo;
			}
			set
			{
				m_SentTo = value;
			}
		}

		private string m_SentBy;
		public string SentBy
		{
			get
			{
				return m_SentBy;
			}
			set
			{
				m_SentBy = value;
			}
		}

		private string m_Link;
		public string Link
		{
			get
			{
				return m_Link;
			}
			set
			{
				m_Link = value;
			}
		}

		private Dictionary<string,object> m_SessionData;
		public Dictionary<string, object> SessionData
		{
			get
			{
				return m_SessionData;
			}
			set
			{
				m_SessionData = value;
			}
		}

		private bool m_IsActive;
		public bool IsActive
		{
			get
			{
				return m_IsActive;
			}
			set
			{
				m_IsActive = value;
			}
		}
	 

	}
}
