using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Common.Feedback
{
	[Serializable()]
	public class FeedbackEventArgs : ExternalDataEventArgs
	{
		private string m_FeedbackBy;
		/// <summary>
		/// Username of the user who is giving the Feedback
		/// </summary>
		public string FeedbackBy
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

		private Guid m_AlertId;
		/// <summary>
		/// ID of the Alert to which the user is responding
		/// </summary>
		public Guid AlertId
		{
			get
			{
				return m_AlertId;
			}
			set
			{
				m_AlertId = value;
			}
		}

		/// <summary>
		/// Constructor to create an FeedbackEventArgs
		/// </summary>
		/// <param name="InstanceID">Workflow Instance Id</param>
		/// <param name="AlertId">Alkert Id to which the user responds</param>
		/// <param name="feedbackBy">Username who responds</param>
		public FeedbackEventArgs(Guid InstanceID, Guid AlertId, string feedbackBy)
			: base(InstanceID)
		{
			this.FeedbackBy = feedbackBy;
			this.AlertId = AlertId;
		}
	}
}
