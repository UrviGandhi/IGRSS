using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Workflow.Activities;
using AdjudicationApplicationRow = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestRow;
using AdjudicationApplicationDataTable = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestDataTable;
using AdjudicationRequestTable = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestDataTable;
using AdjudicationRequestRow = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestRow;
using AdjudicationDocTable = IGRSS.DataAccessLayer.Adjudication.DocumentChecklistTableDataTable;
using AdjudicationFeeTable = IGRSS.DataAccessLayer.Adjudication.AdjudicationFeeDetailsDataTable;
using ValuationSheetTable = IGRSS.DataAccessLayer.Adjudication.ValuationSheetDataTable;
using ValuationSheetRow = IGRSS.DataAccessLayer.Adjudication.ValuationSheetRow;
using ValuationFormTable = IGRSS.DataAccessLayer.Adjudication.ValuationFormDataTable;
using ValuationFormRow = IGRSS.DataAccessLayer.Adjudication.ValuationFormRow;

namespace IGRSS.Workflows.Adjudication.EventArgs
{
	[Serializable]
	public class AdjudicationApplicationUpdatedEventArgs : ExternalDataEventArgs
	{
		private AdjudicationRequestTable m_UpdatedAdjudicationRows;
		/// <summary>
		/// The Adjudication row that has been updated during Verification
		/// </summary>
		public AdjudicationRequestTable UpdatedAdjudicationRows
		{
			get
			{
				return m_UpdatedAdjudicationRows;
			}
			set
			{
				m_UpdatedAdjudicationRows = value;
			}
		}

		private ValuationFormTable m_UpdatedValuationFormRows;
		/// <summary>
		/// Contains the rows that were updated
		/// </summary>
		public ValuationFormTable UpdatedValuationFormRows
		{
			get
			{
				return m_UpdatedValuationFormRows;
			}
			set
			{
				m_UpdatedValuationFormRows = value;
			}
		}
	 


		private DataTable m_DocumentDetails;
		/// <summary>
		/// Details of the Documents submitted for Adjudication
		/// </summary>
		public DataTable DocumentDetails
		{
			get
			{
				return m_DocumentDetails;
			}
			set
			{
				m_DocumentDetails = value;
			}
		}

		private DataTable m_FeeDetails;
		/// <summary>
		/// Fee details that were selected during updation
		/// </summary>
		public DataTable FeeDetails
		{
			get
			{
				return m_FeeDetails;
			}
			set
			{
				m_FeeDetails = value;
			}
		}
	 
		public AdjudicationApplicationUpdatedEventArgs(Guid InstanceId)
			: base(InstanceId)
		{

		}

		public AdjudicationApplicationUpdatedEventArgs(Guid InstanceId, AdjudicationRequestRow UpdatedAdjudicationRow, ValuationFormRow UpdatedValuationFormRow, DataTable FeeDetails, DataTable DocumentDetails)
		    : base(InstanceId)
		{
			this.UpdatedAdjudicationRows = (AdjudicationRequestTable) UpdatedAdjudicationRow.Table;
			UpdatedAdjudicationRow.AdjudicationId = new Guid();
			this.UpdatedAdjudicationRows.Rows.Add(UpdatedAdjudicationRow);
			this.UpdatedValuationFormRows = (ValuationFormTable) UpdatedValuationFormRow.Table;
			UpdatedAdjudicationRow.ValuationFormId = new Guid();
			this.UpdatedValuationFormRows.Rows.Add(UpdatedValuationFormRow);
            this.m_FeeDetails = FeeDetails;
			this.m_DocumentDetails = DocumentDetails;
			

		}
	}
}
