using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;

namespace IGRSS.Workflows.License.EventArgs
{
	[Serializable]
	public class ApplicationSavedEventArgs : ExternalDataEventArgs
	{
		public ApplicationSavedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{


		}

	}
}
