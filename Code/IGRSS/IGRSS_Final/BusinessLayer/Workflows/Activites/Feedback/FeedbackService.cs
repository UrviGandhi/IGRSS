using System;
using System.Collections.Generic;
using System.Text;

namespace IGRSS.Workflows.Activites.Feedback.Events
{
	public class FeedbackService : IFeedbackService
	{
		#region IFeedbackService Members

		public event EventHandler<FeedbackEventArgs> Approve;

		public event EventHandler<FeedbackEventArgs> Reject;

		#endregion

		public void ApproveRequest(Guid Id, FeedbackEventArgs args)
		{
			if (Approve != null)
				Approve(null, new FeedbackEventArgs(Id, args.UserOfficeId, args.FeedbackBy));
		}

		public void RejectRequest(Guid Id, FeedbackEventArgs args)
		{
			if (Reject != null)
				Reject(null, new FeedbackEventArgs(Id, args.UserOfficeId, args.FeedbackBy));
		}
	}
}
