using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.License.EventArgs
{
	[Serializable]
	public class LicenseIssuedEventArgs : ExternalDataEventArgs
	{
		public LicenseIssuedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
