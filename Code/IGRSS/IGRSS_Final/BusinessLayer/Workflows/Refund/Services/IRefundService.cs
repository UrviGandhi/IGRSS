using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Refund.EventArgs;
using IGRSS.Workflows.Common.Feedback;

namespace IGRSS.Workflows.Refund.Services
{
	[ExternalDataExchange]
	public interface IRefundService
	{
		event EventHandler<RefundApplicationSavedEventArgs> RefundApplicationSaved;

		event EventHandler<RefundApplicationUpdatedEventArgs> RefundApplicationUpdated;

		event EventHandler<RefundIssuedEventArgs> RefundIssued;
        
        event EventHandler<FeedbackEventArgs> RefundValid;

        event EventHandler<FeedbackEventArgs> RefundInvalid;

        event EventHandler<FeedbackEventArgs> RefundApproved;

        event EventHandler<FeedbackEventArgs> RefundRejected;

	}
}
