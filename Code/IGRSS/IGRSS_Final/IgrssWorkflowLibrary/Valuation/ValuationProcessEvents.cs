using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows
{
	[Serializable()]
	public class ValuationProcessEvents : IGRSS.Workflows.Events.IValuationEvents
	{
		#region IValuationEvents Members

		public event EventHandler<System.Workflow.Activities.ExternalDataEventArgs> PhysicalVerificationRequired;

		public event EventHandler<System.Workflow.Activities.ExternalDataEventArgs> NoPhysicalVerificationRequired;

		public event EventHandler<System.Workflow.Activities.ExternalDataEventArgs> SaveValuationReport;

		public event EventHandler<System.Workflow.Activities.ExternalDataEventArgs> RequestValuation;

		#endregion

		public void OnValuationRequest()
		{
			ExternalDataEventArgs e = new ExternalDataEventArgs(IgrssCommon.lastWf);
			if (RequestValuation != null)
			{
				RequestValuation(this, e);
			}
		}
	}
}
