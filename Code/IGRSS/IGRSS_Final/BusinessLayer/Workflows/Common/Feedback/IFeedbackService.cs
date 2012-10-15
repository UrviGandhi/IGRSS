using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Common.Feedback
{
	[ExternalDataExchange()]
	public interface IFeedbackService
	{
		event EventHandler<FeedbackEventArgs> Approve;

		event EventHandler<FeedbackEventArgs> Reject;
	}
}
