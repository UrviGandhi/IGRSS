using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Activites.Feedback.Events
{
	[ExternalDataExchange()]
	[CorrelationParameter("AssignedTo")]
	public interface IFeedbackServiceCorrelated
	{
		[CorrelationAlias("AssignedTo", "e.AssignedTo")]
		event EventHandler<FeedbackEventArgs> VerificationPassed;

		[CorrelationAlias("AssignedTo", "e.AssignedTo")]
		event EventHandler<FeedbackEventArgs> VerificationFailed;

		[CorrelationInitializer]
		void AlertUser(string AssignedTo, string alertMessage);
	}
}
