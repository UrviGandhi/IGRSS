using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.Workflows.Complain.EventArgs;

namespace IGRSS.Workflows.Complain.Services
{
	[Serializable]
	public class ComplainService : IComplainService
	{
		#region IComplainService Members

		public event EventHandler<ComplainFiledEventArgs> ComplainFiled;

		public event EventHandler<ComplainAcceptedEventArgs> ComplainAccepted;

		public event EventHandler<InvestigationRequiredEventArgs> InvestigationRequired;

		public event EventHandler<NoInvestigationRequiredEventArgs> NoInvestigationRequired;

		public event EventHandler<AddInvestigationDetailsEventArgs> AddInvedtigationDetails;

		public event EventHandler<InvestigationDoneEventArgs> InvestigationDone;

		public event EventHandler<ReAssignInvestigationEventArgs> ReAssignInvestigation;

		public event EventHandler<FileClosedEventArgs> FileClosed;

		#endregion

		public void RequireInvestigation(Guid InstanceId, InvestigationRequiredEventArgs args)
		{
			if (null != InvestigationRequired)
			{
				InvestigationRequired(null, args);
			}
		}

		public void InvestigationNotRequired(Guid InstanceId)
		{
			if (null != NoInvestigationRequired)
			{
				NoInvestigationRequired(null, new NoInvestigationRequiredEventArgs(InstanceId));
			}
		}

		public void SubmmitInvestigationDetails(Guid InstanceId,AddInvestigationDetailsEventArgs args)
		{
			if (null != AddInvedtigationDetails)
			{
				AddInvedtigationDetails(null, args);
			}
		}

		public void CloseInvestigation(Guid InstanceId, InvestigationDoneEventArgs args)
		{
			if (null != InvestigationDone)
			{
				InvestigationDone(null, args);
			}
		}

		public void ReInvestigate(Guid InstanceId)
		{
			if (null != ReAssignInvestigation)
			{
				ReAssignInvestigation(null, new ReAssignInvestigationEventArgs(InstanceId));
			}
		}

		public void CloseComplainFile(Guid InstanceId)
		{
			if (null != FileClosed)
			{
				FileClosed(null, new FileClosedEventArgs(InstanceId));
			}
		}
	}
}
