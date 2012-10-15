using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Complain.EventArgs;

namespace IGRSS.Workflows.Complain.Services
{
	[ExternalDataExchange]
	interface IComplainService
	{
		event EventHandler<ComplainFiledEventArgs> ComplainFiled;

		event EventHandler<ComplainAcceptedEventArgs> ComplainAccepted;

		event EventHandler<InvestigationRequiredEventArgs> InvestigationRequired;

		event EventHandler<NoInvestigationRequiredEventArgs> NoInvestigationRequired;

		event EventHandler<AddInvestigationDetailsEventArgs> AddInvedtigationDetails;

		event EventHandler<InvestigationDoneEventArgs> InvestigationDone;

		event EventHandler<ReAssignInvestigationEventArgs> ReAssignInvestigation;

		event EventHandler<FileClosedEventArgs> FileClosed;

	}
}
