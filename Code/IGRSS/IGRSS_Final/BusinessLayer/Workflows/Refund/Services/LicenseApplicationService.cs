using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Common.Feedback;
using IGRSS.Workflows.Refund.EventArgs;

namespace IGRSS.Workflows.Refund.Services
{
	public class RefundService : IRefundService, IFeedbackService
	{
		#region IRefundService Members

		public event EventHandler<RefundApplicationSavedEventArgs> RefundApplicationSaved;

		public event EventHandler<RefundApplicationUpdatedEventArgs> RefundApplicationUpdated;

		public event EventHandler<RefundIssuedEventArgs> RefundIssued;

		#endregion

		#region IFeedbackService Members

		public event EventHandler<FeedbackEventArgs> Approve;

		public event EventHandler<FeedbackEventArgs> Reject;

		#endregion

		public void SaveRefundApplication(Guid InstanceId, RefundApplicationSavedEventArgs args)
		{
			if (null != RefundApplicationSaved)
			{
				RefundApplicationSaved(null, args);
			}
		}

		public void UpdateRefundApplication(Guid InstanceId, RefundApplicationUpdatedEventArgs args)
		{
			if (null != RefundApplicationUpdated)
			{
				RefundApplicationUpdated(null, args);
			}
		}

		public void IssueRefund(Guid InstanceId, RefundIssuedEventArgs args)
		{
			if (null != RefundIssued)
			{
				RefundIssued(null, args);
			}
		}

		public void ValidateRefundApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Approve)
			{
				Approve(null, args);
			}
		}

		public void InvalidateRefundApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Reject)
			{
				Reject(null, args);
			}
		}

		public void ApproveRefundApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Approve)
			{
				Approve(null, args);
			}
		}

		public void RejectRefundApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Reject)
			{
				Reject(null, args);
			}
		}
		
	}
}
