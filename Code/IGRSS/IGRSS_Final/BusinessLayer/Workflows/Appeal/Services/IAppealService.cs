using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Appeal.EventArgs;
using IGRSS.Workflows.Common.Feedback;

namespace IGRSS.Workflows.Appeal.Services
{
	[ExternalDataExchange]
	public interface IAppealService
	{
		event EventHandler<AppealApplicationSavedEventArgs> AppealApplicationSaved;

		event EventHandler<AppealApplicationUpdatedEventArgs> AppealApplicationUpdated;

		event EventHandler<AppealIssuedEventArgs> AppealIssued;

		event EventHandler<FeedbackEventArgs> Approve;

		event EventHandler<FeedbackEventArgs> Reject;

	}
}
