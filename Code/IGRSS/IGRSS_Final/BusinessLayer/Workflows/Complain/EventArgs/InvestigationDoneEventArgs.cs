using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.Complain.EventArgs
{
	[Serializable]
	public class InvestigationDoneEventArgs : ExternalDataEventArgs
	{
		private DateTime m_InvestigationDate;
		public DateTime InvestigationDate
		{
			get
			{
				return m_InvestigationDate;
			}
			set
			{
				m_InvestigationDate = value;
			}
		}

		private string m_InvestigationDetails;
		public string InvestigationDetails
		{
			get
			{
				return m_InvestigationDetails;
			}
			set
			{
				m_InvestigationDetails = value;
			}
		}

		public InvestigationDoneEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}

	}
}
