using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Refund.EventArgs
{
	public class RefundApprovedEventArgs : ExternalDataEventArgs
	{
		public RefundApprovedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
