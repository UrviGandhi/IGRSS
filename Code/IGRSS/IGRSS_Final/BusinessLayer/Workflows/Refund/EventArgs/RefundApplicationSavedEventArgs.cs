using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Refund.EventArgs
{
	[Serializable]
	public class RefundApplicationSavedEventArgs : ExternalDataEventArgs
	{
		public RefundApplicationSavedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
