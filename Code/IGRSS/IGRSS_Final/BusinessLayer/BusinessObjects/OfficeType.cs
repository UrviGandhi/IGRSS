using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace IGRSS.BusinessObjects
{
	[Serializable]
	public class OfficeType
	{
		private string m_TypeName;
		public string TypeName
		{
			get
			{
				return m_TypeName;
			}
			set
			{
				m_TypeName = value;
			}
		}

		private Guid m_TypeId;
		protected internal Guid TypeId
		{
			get
			{
				return m_TypeId;
			}
			set
			{
				m_TypeId = value;
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

		private Dictionary<string, Guid> m_CommunicatingOffices;
		public Dictionary<string, Guid> CommunicatingOffices
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

		public OfficeType(string typeName, string description)
		{
			this.TypeId = Guid.NewGuid();
			this.TypeName = typeName;
			this.Description = description;
		}

		public OfficeType()
		{

		}
	}
}
