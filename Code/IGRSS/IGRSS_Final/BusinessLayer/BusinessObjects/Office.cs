using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects;

namespace IGRSS.BusinessObjects
{
	[Serializable]
	public class Office
	{
		private string m_OfficeName;
		public string OfficeName
		{
			get
			{
				return m_OfficeName;
			}
			set
			{
				m_OfficeName = value;
			}
		}

		private Guid m_OfficeId;
		public Guid OfficeId
		{
			get
			{
				return m_OfficeId;
			}
			set
			{
				m_OfficeId = value;
			}
		}

		private OfficeType m_OfficeType;
		public OfficeType OfficeType
		{
			get
			{
				return m_OfficeType;
			}
			set
			{
				m_OfficeType = value;
			}
		}

		private string m_Description;
		public string Description
		{
			get
			{
				return m_Description;
			}
			set
			{
				m_Description = value;
			}
		}

		private Dictionary<Guid, Guid> m_CommunicatingOffices;
		public Dictionary<Guid, Guid> CommunicatingOffices
		{
			get
			{
				return m_CommunicatingOffices;
			}
			set
			{
				m_CommunicatingOffices = value;
			}
		}

		public Office(string name, OfficeType officeType, string description)
		{
			if (name == null)
				throw new ArgumentNullException("name", "Null passed to Office Constructor");
			if (officeType == null)
				throw new ArgumentNullException("officeType", "Null passed to Office Constructor");
			if (description == null)
				throw new ArgumentNullException("description", "Null passed to Office Constructor");

			this.OfficeId = Guid.NewGuid();
			this.OfficeName = name;
			this.OfficeType = officeType;
			this.Description = description;
		}

		public Office()
		{

		}
	}

}
