using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.License.EventArgs;
using IGRSS.Workflows.Common.Feedback;

namespace IGRSS.Workflows.License.Services
{
	public class LicenseApplicationService : ILicenseApplicationService
	{
		#region ILicenseApplicationService Members

		public event EventHandler<ApplicationSavedEventArgs> ApplicationSaved;

		public event EventHandler<ApplicationUpdatedEventArgs> ApplicationUpdated;

		public event EventHandler<LicenseIssuedEventArgs> LicenseIssued;

		public event EventHandler<FeedbackEventArgs> Approve;

		public event EventHandler<FeedbackEventArgs> Reject;

		#endregion

		public void SaveApplication(Guid InstanceId, ApplicationSavedEventArgs args)
		{
			if (null != ApplicationSaved)
			{
				ApplicationSaved(null, args);
			}
		}

		public void UpdateApplication(Guid InstanceId, ApplicationUpdatedEventArgs args)
		{
			if (null != ApplicationUpdated)
			{
				ApplicationUpdated(null, args);
			}
		}

		public void IssueLicense(Guid InstanceId, LicenseIssuedEventArgs args)
		{
			if (null != LicenseIssued)
			{
				LicenseIssued(null, args);
			}
		}

		public void ValidateLicenseApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Approve)
			{
				Approve(null, args);
			}
		}

		public void InvalidateLicenseApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Reject)
			{
				Reject(null, args);
			}
		}

		public void ApproveLicenseApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Approve)
			{
				Approve(null, args);
			}
		}

		public void RejectLicenseApplication(Guid InstanceId, FeedbackEventArgs args)
		{
			if (null != Reject)
			{
				Reject(null, args);
			}
		}

	}
}
