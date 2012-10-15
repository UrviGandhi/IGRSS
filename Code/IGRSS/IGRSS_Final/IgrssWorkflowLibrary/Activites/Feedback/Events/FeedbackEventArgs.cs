using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Activites.Feedback.Events
{
	[Serializable()]
	public class FeedbackEventArgs : ExternalDataEventArgs
	{
		private Guid m_FeedbackBy;
		public Guid FeedbackBy
		{
			get
			{
				return m_FeedbackBy;
			}
			set
			{
				m_FeedbackBy = value;
			}
		}

		private Guid m_UserOfficeId;
		public Guid UserOfficeId
		{
			get
			{
				return m_UserOfficeId;
			}
			set
			{
				m_UserOfficeId = value;
			}
		}
	 

		public FeedbackEventArgs(Guid InstanceID, Guid UserOfficeId, Guid FeedbackBy)
			: base(InstanceID)
		{
			this.FeedbackBy = FeedbackBy;
			this.UserOfficeId = UserOfficeId;
		}
	}
}
