using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Workflow.Activities;
using RefundApplicationRow = IGRSS.DataAccessLayer.Refund.RefundApplicationRow;
using RefundApplicationDataTable = IGRSS.DataAccessLayer.Refund.RefundApplicationDataTable;
namespace IGRSS.Workflows.Refund.EventArgs
{
	[Serializable]
	public class RefundApplicationUpdatedEventArgs : ExternalDataEventArgs
	{
		private RefundApplicationDataTable m_UpdatedRefundRows;
		/// <summary>
		/// The Refund row that has been updated during Verification
		/// </summary>
		public RefundApplicationDataTable UpdatedRefundRows
		{
			get
			{
				return m_UpdatedRefundRows;
			}
			set
			{
				m_UpdatedRefundRows = value;
			}
		}

		private DataTable m_StampDetails;
		/// <summary>
		/// Details of the Stamps submitted for refund
		/// </summary>
		public DataTable StampDetails
		{
			get
			{
				return m_StampDetails;
			}
			set
			{
				m_StampDetails = value;
			}
		}

		private DataTable m_ActsApplicable;
		/// <summary>
		/// Acts that were selected during updation
		/// </summary>
		public DataTable ActsApplicable
		{
			get
			{
				return m_ActsApplicable;
			}
			set
			{
				m_ActsApplicable = value;
			}
		}
	 
		public RefundApplicationUpdatedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}

		public RefundApplicationUpdatedEventArgs(Guid InstanceId, RefundApplicationRow UpdatedRefundRow, DataTable StampDetails, DataTable ActsApplicable)
		    : base(InstanceId)
		{
			this.UpdatedRefundRows = (RefundApplicationDataTable) UpdatedRefundRow.Table;
			UpdatedRefundRow.RefundApplicationId = new Guid();
			this.UpdatedRefundRows.Rows.Add(UpdatedRefundRow);

			this.StampDetails = StampDetails;
			this.ActsApplicable = ActsApplicable;
			
		}
	}
}
