using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.License.Events
{
	[ExternalDataExchange]
	interface ILicenseApplicationEvents
	{

		event EventHandler<ExternalDataEventArgs> ApplicationSaved;

		event EventHandler<ExternalDataEventArgs> ApplicationUpdated;

		event EventHandler<ExternalDataEventArgs> LicenseIssued;
	}
}
