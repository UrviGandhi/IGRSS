using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Common.Feedback;
using IGRSS.Workflows.Adjudication.EventArgs;

namespace IGRSS.Workflows.Adjudication.Services
{
	public class AdjudicationService : IAdjudicationService
	{
		#region IAdjudicationService Members

		public event EventHandler<AdjudicationApplicationSavedEventArgs> AdjudicationApplicationSaved;

		public event EventHandler<AdjudicationApplicationUpdatedEventArgs> AdjudicationApplicationUpdated;

		public event EventHandler<FeedbackEventArgs> AdjudicationValid;

		public event EventHandler<FeedbackEventArgs> AdjudicationInvalid;

		public event EventHandler<FeedbackEventArgs> PhysicalVerificationRequired;

		public event EventHandler<FeedbackEventArgs> NoPhysicalVerificationRequired;

		public event EventHandler<FeedbackEventArgs> SubmitVerificationReport;

		public event EventHandler<FeedbackEventArgs> ValuateProperty;

		public event EventHandler<FeedbackEventArgs> IssueValuationReport;

		public event EventHandler<FeedbackEventArgs> IssueStampDutyCertificate;

		#endregion

		public void SaveAdjudicationApplication(Guid InstanceId, AdjudicationApplicationSavedEventArgs args)
		{
			if (null != AdjudicationApplicationSaved)
			{
				AdjudicationApplicationSaved(null, args);
			}
		}

		public void UpdateAdjudicationApplication(Guid InstanceId, AdjudicationApplicationUpdatedEventArgs args)
		{
			if (null != AdjudicationApplicationUpdated)
			{
				AdjudicationApplicationUpdated(null, args);
			}
		}

		public void ValidateAdjudicationApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != AdjudicationValid)
			{
                AdjudicationValid(null, args);
			}
		}

		public void InvalidateAdjudicationApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != AdjudicationInvalid)
			{
                AdjudicationInvalid(null, args);
			}
		}

	}
}
