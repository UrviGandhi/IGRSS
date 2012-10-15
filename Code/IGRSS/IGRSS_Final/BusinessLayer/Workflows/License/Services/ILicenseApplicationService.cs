using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.License.EventArgs;
using IGRSS.Workflows.Common.Feedback;

namespace IGRSS.Workflows.License.Services
{
	[ExternalDataExchange]
	public interface ILicenseApplicationService
	{
		event EventHandler<ApplicationSavedEventArgs> ApplicationSaved;

		event EventHandler<ApplicationUpdatedEventArgs> ApplicationUpdated;

		event EventHandler<LicenseIssuedEventArgs> LicenseIssued;

		event EventHandler<FeedbackEventArgs> Approve;

		event EventHandler<FeedbackEventArgs> Reject;


	}
}
