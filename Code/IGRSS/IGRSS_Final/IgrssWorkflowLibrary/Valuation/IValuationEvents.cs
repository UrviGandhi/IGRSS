using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Events
{
	[ExternalDataExchange]
	public interface IValuationEvents
	{
		/// <summary>
		/// The Physical Verification Required Event
		/// </summary>
		/// <remarks>This event is raised if an Physical Verification is requred on the property.</remarks>
		event EventHandler<ExternalDataEventArgs> PhysicalVerificationRequired;

		/// <summary>
		/// Raised when Physical Varification of the property is not required
		/// </summary>
		/// <remarks>This event will have to be raised to confirm that a Physical Verification is not required on the applicants property.</remarks>
		event EventHandler<ExternalDataEventArgs> NoPhysicalVerificationRequired;

		event EventHandler<ExternalDataEventArgs> SaveValuationReport;

		event EventHandler<ExternalDataEventArgs> RequestValuation;
	}
}
