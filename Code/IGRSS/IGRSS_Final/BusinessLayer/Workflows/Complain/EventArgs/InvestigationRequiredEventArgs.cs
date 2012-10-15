using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using IGRSS.BusinessObjects;

namespace IGRSS.Workflows.Complain.EventArgs
{
	[Serializable]
	public class InvestigationRequiredEventArgs : ExternalDataEventArgs
	{
		private string m_InvestigatingOfficer;
		public string InvestigatingOfficer
		{
			get
			{
				return m_InvestigatingOfficer;
			}
			set
			{
				m_InvestigatingOfficer = value;
			}
		}

		public InvestigationRequiredEventArgs(Guid InstanceId)
			: base(InstanceId)
		{
		}
	}
}
