using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Refund.EventArgs
{
	public class RefundRejectedEventArgs : ExternalDataEventArgs
	{
		public RefundRejectedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
