using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Common.Feedback;
using IGRSS.Workflows.Appeal.EventArgs;

namespace IGRSS.Workflows.Appeal.Services
{
	public class AppealService : IAppealService
	{

		#region IAppealService Members

		public event EventHandler<AppealApplicationSavedEventArgs> AppealApplicationSaved;

		public event EventHandler<AppealApplicationUpdatedEventArgs> AppealApplicationUpdated;

		public event EventHandler<AppealIssuedEventArgs> AppealIssued;

		public event EventHandler<FeedbackEventArgs> Approve;

		public event EventHandler<FeedbackEventArgs> Reject;

		#endregion

		public void SaveAppealApplication(Guid InstanceId, AppealApplicationSavedEventArgs args)
		{
			if (null != AppealApplicationSaved)
			{
				AppealApplicationSaved(null, args);
			}
		}

		public void UpdateAppealApplication(Guid InstanceId, AppealApplicationUpdatedEventArgs args)
		{
			if (null != AppealApplicationUpdated)
			{
				AppealApplicationUpdated(null, args);
			}
		}

		public void IssueAppeal(Guid InstanceId, AppealIssuedEventArgs args)
		{
			if (null != AppealIssued)
			{
				AppealIssued(null, args);
			}
		}

		public void ValidateAppealApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Approve)
			{
				Approve(null, args);
			}
		}

		public void InvalidateAppealApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Reject)
			{
				Reject(null, args);
			}
		}

		public void ApproveAppealApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Approve)
			{
				Approve(null, args);
			}
		}

		public void RejectAppealApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Reject)
			{
				Reject(null, args);
			}
		}

	}
}
