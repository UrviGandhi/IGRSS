using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Complain.EventArgs
{
	[Serializable]
	public class NoInvestigationRequiredEventArgs : ExternalDataEventArgs
	{
		public NoInvestigationRequiredEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}

	}
}
