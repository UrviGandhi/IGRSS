using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Refund.EventArgs
{
	public class RefundValidEventArgs : ExternalDataEventArgs
	{
		public RefundValidEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
