using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Activities;
using CompalinTable = IGRSS.DataAccessLayer.Complain.ComplainDetailsDataTable;
using ComplainDetailsRow = IGRSS.DataAccessLayer.Complain.ComplainDetailsRow;

namespace IGRSS.Workflows.Complain.EventArgs
{
	[Serializable]
	public class ComplainAcceptedEventArgs : ExternalDataEventArgs
	{
		private Guid m_ComplainId;
		public Guid ComplainId
		{
			get
			{
				return m_ComplainId;
			}
			set
			{
				m_ComplainId = value;
			}
		}

		private CompalinTable m_UpdatedRows;
		/// <summary>
		/// The rows that were updated
		/// </summary>
		public CompalinTable UpdatedRows
		{
			get
			{
				return m_UpdatedRows;
			}
			set
			{
				m_UpdatedRows = value;
			}
		}


		public ComplainAcceptedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}

		public ComplainAcceptedEventArgs(Guid InstanceId, Guid ComplaintType, Guid AgainstEmpID, Guid ComplainingEmpID, string ComplainantName, string ComplainantAddress, DateTime ComplaintDate, Guid ReceivingOfficeId, string Subject, string Detail, Guid ComplainId, string ComplaintNo)
			: base(InstanceId)
		{
			UpdatedRows = new CompalinTable();
			ComplainDetailsRow row = UpdatedRows.NewComplainDetailsRow();
			row.ComplaintType = ComplaintType;
			row.AgainstEmpID = AgainstEmpID;
			row.ComplainingEmpID = ComplainingEmpID;
			row.ComplainantName = ComplainantName;
			row.ComplainantAddress = ComplainantAddress;
			row.ComplaintDate = ComplaintDate;
			row.ReceivingOfficeId = ReceivingOfficeId;
			row.Subject = Subject;
			row.Detail = Detail;
			row.ComplainId = ComplainId;
			row.ComplaintNo = ComplaintNo;
			UpdatedRows.Rows.Add(row);
		}
	}
}
