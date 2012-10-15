using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Refund.EventArgs
{
	public class RefundInvalidEventArgs : ExternalDataEventArgs
	{
		public RefundInvalidEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
