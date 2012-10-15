using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Workflow.Activities;
using LicenseApplicationRow = IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationRow;
using LicenseApplicationDataTable = IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationDataTable;

namespace IGRSS.Workflows.License.EventArgs
{
	[Serializable]
	public class ApplicationUpdatedEventArgs : ExternalDataEventArgs
	{
		private LicenseApplicationDataTable m_UpdatedLicenseRows;
		public LicenseApplicationDataTable UpdatedLicenseRows
		{
		    get
		    {
				return m_UpdatedLicenseRows;
		    }
		    set
		    {
				m_UpdatedLicenseRows = value;
		    }
		}

		public ApplicationUpdatedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}

		public ApplicationUpdatedEventArgs(Guid InstanceId, LicenseApplicationRow UpdatedRow)
			: base(InstanceId)
		{
			this.UpdatedLicenseRows = (LicenseApplicationDataTable)UpdatedRow.Table;
			UpdatedRow.LicenseApplicationId = new Guid();
			this.UpdatedLicenseRows.Rows.Add(UpdatedRow);
		}
	}
}
