using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace IGRSS.BusinessObjects.WorkflowServices.Context
{
	public interface IContextService
	{
		IDictionary Items
		{
			get;
		}
	}
}
