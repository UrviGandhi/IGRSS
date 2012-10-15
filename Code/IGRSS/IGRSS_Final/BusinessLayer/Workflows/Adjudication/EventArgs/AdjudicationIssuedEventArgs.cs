using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Adjudication.EventArgs
{
	[Serializable]
	public class AdjudicationIssuedEventArgs : ExternalDataEventArgs
	{
		public AdjudicationIssuedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
