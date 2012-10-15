using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace Utilities.Context
{
	public interface IContextService
	{
		IDictionary Items
		{
			get;
		}
	}
}
