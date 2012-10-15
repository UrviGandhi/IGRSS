using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Adjudication.EventArgs;
using IGRSS.Workflows.Common.Feedback;

namespace IGRSS.Workflows.Adjudication.Services
{
	[ExternalDataExchange]
	public interface IAdjudicationService
	{
		event EventHandler<AdjudicationApplicationSavedEventArgs> AdjudicationApplicationSaved;

		event EventHandler<AdjudicationApplicationUpdatedEventArgs> AdjudicationApplicationUpdated;

        event EventHandler<FeedbackEventArgs> AdjudicationValid;

        event EventHandler<FeedbackEventArgs> AdjudicationInvalid;

		event EventHandler<FeedbackEventArgs> PhysicalVerificationRequired;

		event EventHandler<FeedbackEventArgs> NoPhysicalVerificationRequired;

		event EventHandler<FeedbackEventArgs> SubmitVerificationReport;

		event EventHandler<FeedbackEventArgs> IssueValuationReport;

		event EventHandler<FeedbackEventArgs> IssueStampDutyCertificate;

	}
}
