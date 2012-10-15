using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects.WorkflowServices.Context;
using System.Collections;

namespace IGRSS.BusinessObjects.WorkflowServices
{
	class ContextService : IContextService
	{
		public ContextService()
		{
			m_Items = new Dictionary<string, object>();
		}
		private IDictionary m_Items;

		#region IContextService Members

		public IDictionary Items
		{
			get
			{
				return m_Items;
			}
		}

		#endregion
	}
}
