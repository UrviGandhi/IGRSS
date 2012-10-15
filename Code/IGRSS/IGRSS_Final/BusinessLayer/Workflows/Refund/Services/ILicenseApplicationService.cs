using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Refund.EventArgs;

namespace IGRSS.Workflows.Refund.Services
{
	[ExternalDataExchange]
	public interface IRefundService
	{
		event EventHandler<RefundApplicationSavedEventArgs> RefundApplicationSaved;

		event EventHandler<RefundApplicationUpdatedEventArgs> RefundApplicationUpdated;

		event EventHandler<RefundIssuedEventArgs> RefundIssued;
	}
}
