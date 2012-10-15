using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

namespace Utilities.Common
{
	public static class Check
	{
		[DebuggerStepThrough]
		public static void ArgumentIsNotNull(object argument, string name)
		{
			if (argument == null)
			{
				throw new ArgumentNullException(name);
			}
		}

		[DebuggerStepThrough]
		public static void IsTrue(bool argument, string message)
		{
			if (argument == false)
			{
				throw new InvalidOperationException(message);
			}
		}

		[DebuggerStepThrough]
		public static void IsNotTrue(bool argument, string message)
		{
			if (argument == true)
			{
				throw new InvalidOperationException(message);
			}
		}

		[DebuggerStepThrough]
		public static void IsNotNull(object argument, string message)
		{
			if (argument == null)
			{
				throw new InvalidOperationException(message);
			}
		}
	}
}
