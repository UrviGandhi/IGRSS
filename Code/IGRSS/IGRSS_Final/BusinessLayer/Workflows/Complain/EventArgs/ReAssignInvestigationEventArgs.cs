using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Complain.EventArgs
{
	[Serializable]
	public class ReAssignInvestigationEventArgs : ExternalDataEventArgs
	{
		public ReAssignInvestigationEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}

	}
}
