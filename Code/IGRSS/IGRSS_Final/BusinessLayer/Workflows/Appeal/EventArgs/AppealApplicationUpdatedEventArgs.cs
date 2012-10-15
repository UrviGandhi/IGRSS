using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Workflow.Activities;
using AppealApplicationRow = IGRSS.DataAccessLayer.Appeal.AppealApplicationRow;
using AppealApplicationDataTable = IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable;

namespace IGRSS.Workflows.Appeal.EventArgs
{
	[Serializable]
	public class AppealApplicationUpdatedEventArgs : ExternalDataEventArgs
	{
		private AppealApplicationDataTable m_UpdatedApplicationRows;
		/// <summary>
		/// The updated appeal application
		/// </summary>
		public AppealApplicationDataTable UpdatedApplicationRows
		{
			get
			{
				return m_UpdatedApplicationRows;
			}
			set
			{
				m_UpdatedApplicationRows = value;
			}
		}

		private DataTable m_UpdatedActs;
		/// <summary>
		/// The updated Acts for the Appeal
		/// </summary>
		public DataTable UpdatedActs
		{
			get
			{
				return m_UpdatedActs;
			}
			set
			{
				m_UpdatedActs = value;
			}
		}
	 

		public AppealApplicationUpdatedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}

		public AppealApplicationUpdatedEventArgs(Guid InstanceId, AppealApplicationRow UpdatedRow, DataTable Acts)
		    : base(InstanceId)
		{
			this.UpdatedApplicationRows = (AppealApplicationDataTable) UpdatedRow.Table;
			UpdatedRow.AppealApplicationId = Guid.Empty;
			this.UpdatedApplicationRows.Rows.Add(UpdatedRow);
			this.UpdatedActs = Acts;
		}
	}
}
