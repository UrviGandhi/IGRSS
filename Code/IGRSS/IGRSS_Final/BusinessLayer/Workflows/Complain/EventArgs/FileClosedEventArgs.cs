using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Complain.EventArgs
{
	[Serializable]
	public class FileClosedEventArgs : ExternalDataEventArgs
	{
		public FileClosedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}
	}
}
