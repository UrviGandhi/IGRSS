using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.Workflows.License.Events;

namespace IGRSS.Workflows
{
	public class LicenseApplicationEvents : ILicenseApplicationEvents
	{
		#region ILicenseApplicationEvents Members

		public event EventHandler<System.Workflow.Activities.ExternalDataEventArgs> ApplicationSaved;

		public event EventHandler<System.Workflow.Activities.ExternalDataEventArgs> ApplicationUpdated;

		public event EventHandler<System.Workflow.Activities.ExternalDataEventArgs> LicenseIssued;

		#endregion
	}
}
