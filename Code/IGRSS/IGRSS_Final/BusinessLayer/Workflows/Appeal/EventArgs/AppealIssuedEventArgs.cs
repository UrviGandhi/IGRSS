using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Appeal.EventArgs
{
	[Serializable]
	public class AppealIssuedEventArgs : ExternalDataEventArgs
	{
		public AppealIssuedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
