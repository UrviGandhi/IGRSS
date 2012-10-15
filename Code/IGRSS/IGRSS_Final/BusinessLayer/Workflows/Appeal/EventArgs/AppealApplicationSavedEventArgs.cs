using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Appeal.EventArgs
{
	[Serializable]
	public class AppealApplicationSavedEventArgs : ExternalDataEventArgs
	{
		public AppealApplicationSavedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
