using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Activites.Verification.Events
{
	[ExternalDataExchange]
	interface IVerificationEvents
	{
		event EventHandler<ExternalDataEventArgs> VerificationValid;

		event EventHandler<ExternalDataEventArgs> VerificationFalied;
	}
}
