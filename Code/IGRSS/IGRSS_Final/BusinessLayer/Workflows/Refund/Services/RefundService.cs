using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Common.Feedback;
using IGRSS.Workflows.Refund.EventArgs;

namespace IGRSS.Workflows.Refund.Services
{
	public class RefundService : IRefundService
	{

        #region IRefundService Members

        public event EventHandler<RefundApplicationSavedEventArgs> RefundApplicationSaved;

        public event EventHandler<RefundApplicationUpdatedEventArgs> RefundApplicationUpdated;

        public event EventHandler<RefundIssuedEventArgs> RefundIssued;

        public event EventHandler<FeedbackEventArgs> RefundValid;

        public event EventHandler<FeedbackEventArgs> RefundInvalid;

        public event EventHandler<FeedbackEventArgs> RefundApproved;

        public event EventHandler<FeedbackEventArgs> RefundRejected;

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
			if (null != RefundValid)
			{
                RefundValid(null, args);
			}
		}

		public void InvalidateRefundApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != RefundInvalid)
			{
                RefundInvalid(null, args);
			}
		}

		public void ApproveRefundApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != RefundApproved)
			{
                RefundApproved(null, args);
			}
		}

		public void RejectRefundApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != RefundRejected)
			{
                RefundRejected(null, args);
			}
		}

    }
}
